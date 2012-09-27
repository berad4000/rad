package burnt.rad.burn.world
{
    import flash.display.Bitmap;
    import flash.media.Sound;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import burnt.rad.burn.world.graphics.BackgroundAssets;
    import burnt.rad.burn.world.graphics.SoulAssets;
    
    import starling.text.BitmapFont;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Assets
    {
        // If you're developing a game for the Flash Player / browser plugin, you can directly
        // embed all textures directly in this class. This demo, however, provides two sets of
        // textures for different resolutions. That's useful especially for iOS development,
        // where you have to support devices with and without a retina display.
        //
        // For that reason, the actual embed statements are in separate files; one for each
        // resolution. The correct set is chosen depending on the "contentScaleFactor".
        
        // TTF-Fonts
        
		// The 'embedAsCFF'-part IS REQUIRED!!!!
       // [Embed(source="../media/fonts/Ubuntu-R.ttf", embedAsCFF="false", fontFamily="Ubuntu")]        
       // private static const UbuntuRegular:Class;
        
        // Sounds
        //[Embed(source="../media/audio/wing_flap.mp3")]
       // private static const StepSound:Class;
        
        // Texture cache
        
        private static var sContentScaleFactor:int = 1;
        private static var sTextures:Dictionary = new Dictionary();
        private static var sSounds:Dictionary = new Dictionary();
        private static var sTextureAtlas:TextureAtlas;
        private static var sBitmapFontsLoaded:Boolean;
        
        public static function getTexture(name:String):Texture
        {
            if (sTextures[name] == undefined)
            {
				try {
					var data:Object = create(name);
				} catch (error:Error) {
					trace( error );
					return null;
				}
				
                
                if (data is Bitmap)
                    sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false, sContentScaleFactor);
                else if (data is ByteArray)
                    sTextures[name] = Texture.fromAtfData(data as ByteArray, sContentScaleFactor);
            }
            
            return sTextures[name];
        }
		
		public static function getTextureFromClass ( name:String, className:Class ):Texture
		{
			if (sTextures[name] == undefined)
			{
				try {
					var data:Object = createFromClass( name, className );
				} catch (error:Error) {
					trace( error );
					return null;
				}
				
				
				if (data is Bitmap)
					sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false, sContentScaleFactor);
				else if (data is ByteArray)
					sTextures[name] = Texture.fromAtfData(data as ByteArray, sContentScaleFactor);
			}
			
			return sTextures[name];
			
			
		}
		
		public static function getToonTexture(name:String):Texture
		{
			if (sTextures[name] == undefined)
			{
				try {
					var data:Object = createFromClass ( name, SoulAssets );
				} catch (error:Error) {
					trace( error );
					return null;
				}
				
				
				if (data is Bitmap)
					sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false, sContentScaleFactor);
				else if (data is ByteArray)
					sTextures[name] = Texture.fromAtfData(data as ByteArray, sContentScaleFactor);
			}
			
			return sTextures[name];
		}
		
		private static function createFromClass(name:String, source:Class ):Object
		{
			var textureClass:Class = source; 
			return new textureClass[name];
		}
		
        public static function getSound(name:String):Sound
        {
            var sound:Sound = sSounds[name] as Sound;
            if (sound) return sound;
            else throw new ArgumentError("Sound not found: " + name);
        }
		
		public static function fetchToon( toon:String ):TextureAtlas
		{
			var file:String = toon.toUpperCase();
			
			//todo:Create Dictionary and return that value...
			var atlas:TextureAtlas;
			var texture:Texture = getToonTexture(file);
			var xml:XML = XML( createFromClass ( file + "_XML", SoulAssets ));
			atlas = new TextureAtlas(texture, xml);
			
			return atlas;
		}
		
		public static function getTextureAtlas():TextureAtlas
        {
            if (sTextureAtlas == null)
            {
                var texture:Texture = getTexture("AtlasTexture");
                var xml:XML = XML(create("AtlasXml"));
                sTextureAtlas = new TextureAtlas(texture, xml);
            }
            
            return sTextureAtlas;
        }
        
        public static function loadBitmapFonts():void
        {
            if (!sBitmapFontsLoaded)
            {
                var texture:Texture = getTexture("DesyrelTexture");
                var xml:XML = XML(create("DesyrelXml"));
                TextField.registerBitmapFont(new BitmapFont(texture, xml));
                sBitmapFontsLoaded = true;
            }
        }
        
        //public static function prepareSounds():void
        //{
        //   sSounds["Step"] = new StepSound();   
        //}
        
        private static function create(name:String):Object
        {
            var textureClass:Class = BackgroundAssets; 
            return new textureClass[name];
        }
        
        public static function get contentScaleFactor():Number { return sContentScaleFactor; }
        public static function set contentScaleFactor(value:Number):void 
        {
            for each (var texture:Texture in sTextures)
                texture.dispose();
            
            sTextures = new Dictionary();
            sContentScaleFactor = value < 1.5 ? 1 : 2; // assets are available for factor 1 and 2 
        }
    }
}
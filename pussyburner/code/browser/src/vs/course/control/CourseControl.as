package vs.course.control
{
	import com.greensock.TweenMax;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import vs.Creation;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.LandscapeLayer;
	import vs.course.core.CourseCore;

	public class CourseControl 
	{
		protected var core:CourseCore;
		
		protected var atlusLoader:LoaderMax;
		protected var creationTexutureLoader:LoaderMax;
		
		protected var environmentLoader:LoaderMax;
		protected var landscapeLoader:LoaderMax;
		
		 //we will be moving this into the model
		
		public function CourseControl( core:CourseCore = null )
		{
			if ( core != null ) this.core = core;
		}
		
		public function destroy ():void
		{
			this.core.bitmapData 				= null;
			this.core.creationLocation 			= null;
			this.core.landscape 				= null;
			this.core.textures					= null;
			this.core.creations 				= null;
			this.core.atlus						= null;
			
			atlusLoader							= null;
			creationTexutureLoader				= null;
			
			environmentLoader					= null;
			landscapeLoader						= null;
		}
		
		public function updateCreationLocation ( location:String ):void {
			trace("you got a core " + core );
			this.core.creationLocation = location 
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.core.width 	= width;
			this.core.height 	= height;
		}
		
		public function creation ( type:String, x:Number = 0, y:Number = 0 ):void
		{
			var creation:Creation = dynamicCreation ( type );
			
			if ( creation == null ) return;
			creation.awake();
			this.core.creations[ creation.id ] = creation; 
			
			//trace("ok looking for an atlus location boyz " + creation.atlasLocation );
			
			loadAtlus( creation.atlasLocation, creation.id ); 
		}
		
		public function landscape ( src:String, parallax:Number = 1,  y:Number = 0, layer:int = 0 ):void
		{
			var  landscapeLayer:LandscapeLayer = new LandscapeLayer;
			landscapeLayer.parallax = parallax;
			landscapeLayer.y		= y;
			landscapeLayer.layer 	= layer;
			
			this.core.landscape[ landscapeLayer.id ] 	= landscapeLayer;
			loadLandscapeLayer( src, landscapeLayer.id );
		}
		
		public function environment ( src:String = null ):void
		{
			loadEnvironment( src );	
		}
		
		private function loadAtlus ( url:String, id:String ):void
		{
			//trace("loading the atlus " + url + " ::: " + id );
			
			if ( atlusLoader == null ) atlusLoader = new LoaderMax( { onChildComplete:loadAtlusComplete } );
			
			atlusLoader.append( new XMLLoader( url, { name:id }  ) ); 	
			atlusLoader.load( false );
		}
		
		private function loadAtlusComplete ( event:LoaderEvent ):void
		{
			var loader:XMLLoader = XMLLoader( event.target ); 
			var xml:XML =  loader.content;
			this.core.atlus[ loader.url ] = xml; 
			
			var creation:Creation = this.core.creations[ loader.name ];
			loadCreationTexture( creation.textureLocation , creation.id );
		}
		
		private function loadCreationTexture( url:String, id:String ):void
		{
			if (  creationTexutureLoader == null )  creationTexutureLoader = new LoaderMax( { onChildComplete:loadCreationTextureComplete } );
			
			creationTexutureLoader.append( new ImageLoader( url, { name:id }  ) ); 	
			creationTexutureLoader.load( false );
		}
		
		private function loadCreationTextureComplete ( event:LoaderEvent ):void
		{
			var imageLoader:ImageLoader = ImageLoader( event.target ); 
			if ( event.target.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			var bitmap:Bitmap 			= event.target.content.rawContent;
			var creation:Creation 		= this.core.creations[ imageLoader.name ];
			var atlus:XML				= this.core.atlus[ creation.atlasLocation ];
			
			var texture:Texture	= Texture.fromBitmap( bitmap, true, false, core.scaleFactor);
			var textureAtlus:TextureAtlas = new TextureAtlas( texture, atlus );
			
			creation.atlas = textureAtlus;
			addCreation ( creation );
		}
		
		private function addCreation ( creation:Creation ):void
		{
			this.core.cosmos.addCreation( creation );
		}
		
		private function dynamicCreation ( type:String ):Creation
		{
			var creation:Creation;
			var classInstance:Class;
			
			var def:String = this.core.creationLocation + type;
			
			try 
			{
				classInstance = getDefinitionByName( this.core.creationLocation + type ) as Class;
				creation = new classInstance;
			}
			catch (error:Error) { trace( error.toString() );	}
			
			return creation;
		}
	
		
		private function loadLandscapeLayer( url:String, id:String = null ):void
		{
			if ( landscapeLoader == null ) landscapeLoader = new LoaderMax( { onChildComplete:loadLandscapeLayerComplete } );
			
			landscapeLoader.append( new ImageLoader( url, { name:id }  ) ); 	
			landscapeLoader.load( false );
		}
		
		private function loadLandscapeLayerComplete(  event:LoaderEvent ):void
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			var bitmap:Bitmap 			= event.target.content.rawContent;
			var bitmapData:BitmapData	= new BitmapData( bitmap.width, bitmap.height );
			bitmapData.draw( bitmap );
			
			this.core.bitmapData[ loader.url ] = bitmapData;
			
			var layer:LandscapeLayer = this.core.landscape[ loader.name ]; 
			layer.updateTextures( textureFromBitmapData( bitmapData ), textureFromBitmapData( bitmapData )  );
			
			this.core.cosmos.addLandscape( layer );
		}
		
		private function loadEnvironment( url:String, id:String = null ):void
		{
			if ( environmentLoader == null ) environmentLoader = new LoaderMax( { onChildComplete:loadEnvironmentComplete } );
			
			environmentLoader.append( new ImageLoader( url ) ); 	
			environmentLoader.load( false );
		}
		
		private function loadEnvironmentComplete ( event:LoaderEvent ):void  
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			var bitmap:Bitmap 			= event.target.content.rawContent;
			var bitmapData:BitmapData	= new BitmapData( bitmap.width, bitmap.height );
			bitmapData.draw( bitmap );
			
			this.core.bitmapData[ loader.url ] = bitmapData;
			var environment:Environment = new Environment( textureFromBitmapData( this.core.bitmapData[ loader.url ] ) );
			addEnvironment( environment );
		}
		
		private function addEnvironment( display:Environment ):void
		{
			if ( core.cosmos == null ) return;
			core.cosmos.addEnvironment( display );
		}
		
		private function textureFromBitmapData( data:BitmapData ):Texture 
		{
			return Texture.fromBitmapData(data, true, false, core.scaleFactor);
		}
		
		private function textureFromBitmap( data:Bitmap ):Texture 
		{
			return  Texture.fromBitmap(data, true, false, core.scaleFactor);
		}
	}
}
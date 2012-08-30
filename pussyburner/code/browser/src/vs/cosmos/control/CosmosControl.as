package vs.cosmos.control
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
	import vs.cosmos.content.environment.Environment;
	import vs.cosmos.core.CosmosCore;
	import vs.cosmos.core.data.DataLandscapeLayer;
	import vs.cosmos.core.object.CosmosType;

	public class CosmosControl 
	{
		protected var core:CosmosCore;
		
		protected var atlusLoader:LoaderMax;
		protected var creationTexutureLoader:LoaderMax;
		
		protected var environmentLoader:LoaderMax;
		protected var landscapeLoader:LoaderMax;
		
		public var creationLocation:String	= "brnr.creation.form."; //we will be moving this into the model
		
		public function CosmosControl( core:CosmosCore = null )
		{
			if ( core != null ) this.core = core;
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.core.width 	= width;
			this.core.height 	= height;
		}
		
		public function creation ( type:String, x:Number = 0, y:Number = 0 ):void
		{
			var creation:Creation = dynamicCreation ( type );
			creation.awake();
			this.core.creations[ creation.id ] = creation; 
			
			loadAtlus( creation.atlasLocation, creation.id ); 
		}
		
		private function loadAtlus ( url:String, id:String ):void
		{
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
			
			var creation:Creation = this.core.creations[ imageLoader.name ];
			
			var atlus:XML				= this.core.atlus[ creation.atlasLocation ];
			
			var texture:Texture	= Texture.fromBitmap( bitmap, true, false, core.scaleFactor);
			var textureAtlus:TextureAtlas = new TextureAtlas( texture, atlus );
			
			trace("i need a hero " + atlus );
			
			
			trace("do you still have a texture atlas " + textureAtlus );
			creation.atlas = textureAtlus;
			addCreation ( creation );
			
			//nEED A TEXTURE
			//atlas = new TextureAtlas(texture, xml);
			
			//var bitmapData:BitmapData	= new BitmapData( bitmap.width, bitmap.height ); 
			//bitmapData.draw( bitmap );
			
			//var clone:Bitmap = new Bitmap( bitmapData );
			//var texture1:Texture			= createTextureFromBitmap( imageLoader.url,		 	bitmap);
			//var texture2:Texture			= createTextureFromBitmap( imageLoader.url + "2", 	clone );
			
			//var data:DataLandscapeLayer = core.landscape[ imageLoader.name ];
			//this.core.cosmos.addLandscape( texture1, texture2, data );
		}
		
		private function addCreation ( creation:Creation ):void
		{
			this.core.cosmos.addCreation( creation );
		}
		
		
		private function dynamicCreation ( type:String ):Creation
		{
			var creation:Creation;
			var classInstance:Class;
			
			try 
			{
				classInstance = getDefinitionByName( creationLocation + type ) as Class;
				creation = new classInstance;
			}
			catch (error:Error)
			{
				trace( error.toString() );	
			}
			
			return creation;
		}
		
		//public static function createTextureAltas(  ):TextureAtlas
		//{
		//	var file:String = toon.toUpperCase();
			
			//todo:Create Dictionary and return that value...
		//	var atlas:TextureAtlas;
		//	var texture:Texture = getToonTexture(file);
		//	var xml:XML = XML( createFromClass ( file + "_XML", SoulAssets ));
		//
			
		//	return atlas;
		//}
		
		public function createEnvironment ( src:String = null, id:String = null ):void
		{
			loadEnvironment( src, id );	
		}
		
		public function createLandscapeLayer ( url:String, id:String = null,  parallax:Number = 1,  y:Number = 0 ):void
		{
			var data:DataLandscapeLayer = new DataLandscapeLayer( y, parallax );
			this.core.landscape[ id ] 	= data;
			loadLandscapeLayer( url, id );
		}
		
		private function loadLandscapeLayer( url:String, id:String = null ):void
		{
			if ( landscapeLoader == null ) landscapeLoader = new LoaderMax( { onChildComplete:loadLandscapeLayerComplete } );
			
			landscapeLoader.append( new ImageLoader( url, { name:id }  ) ); 	
			landscapeLoader.load( false );
		}
		
		private function loadLandscapeLayerComplete(  event:LoaderEvent ):void
		{
			var imageLoader:ImageLoader = ImageLoader( event.target ); 
			if ( event.target.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			var bitmap:Bitmap 			= event.target.content.rawContent;
			
			var bitmapData:BitmapData	= new BitmapData( bitmap.width, bitmap.height ); 
			bitmapData.draw( bitmap );
			
			var clone:Bitmap = new Bitmap( bitmapData );
			var texture1:Texture			= createTextureFromBitmap( imageLoader.url,		 	bitmap);
			var texture2:Texture			= createTextureFromBitmap( imageLoader.url + "2", 	clone );
			
			var data:DataLandscapeLayer = core.landscape[ imageLoader.name ];
			this.core.cosmos.addLandscape( texture1, texture2, data );
		}
		
		private function loadEnvironment( url:String, id:String = null ):void
		{
			if ( environmentLoader == null ) environmentLoader = new LoaderMax( { onChildComplete:loadEnvironmentComplete } );
			
			environmentLoader.append( new ImageLoader( url, { name:id }  ) ); 	
			environmentLoader.load( false );
		}
		
		private function loadEnvironmentComplete ( event:LoaderEvent ):void  
		{
			var imageLoader:ImageLoader = ImageLoader( event.target ); 
			if ( event.target.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			var bitmap:Bitmap 			= event.target.content.rawContent;
			var texture:Texture			= createTextureFromBitmap( imageLoader.url, bitmap );
			var environment:Environment = new Environment( texture );
			addEnvironment( environment );
		}
		
		private function addEnvironment( display:Environment ):void
		{
			if ( core.cosmos == null ) return;
			core.cosmos.addEnvironment( display );
		}
		
		private function createTextureFromBitmap(src:String, data:Bitmap ):Texture 
		{
			if ( this.core.textures[ src ] != null ) return this.core.textures[ src ];
			this.core.textures[src] = Texture.fromBitmap(data, true, false, core.scaleFactor);
			return this.core.textures[ src ];
		}
	}
}
package vs.cosmos.control
{
	import com.greensock.TweenMax;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	import vs.cosmos.content.environment.Environment;
	import vs.cosmos.core.CosmosCore;
	import vs.cosmos.core.data.DataLandscapeLayer;
	import vs.cosmos.core.object.CosmosType;

	public class CosmosControl 
	{
		protected var core:CosmosCore;
		
		
		protected var environmentLoader:LoaderMax;
		protected var landscapeLoader:LoaderMax;
		
		public function CosmosControl( core:CosmosCore = null )
		{
			if ( core != null ) this.core = core;
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.core.width 	= width;
			this.core.height 	= height;
		}
		
		public function create ( type:String, src:String = null, id:String = null ):void
		{
			switch ( type )
			{
				case CosmosType.ENVIRONMENT:
				loadEnvironment( src, id );	
				break;
				
				case CosmosType.LANDSCAPE_LAYER:
					
				break;
			}
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
			
			trace("looking for a name " + imageLoader.name );
			var data:DataLandscapeLayer = core.landscape[ imageLoader.name ];
			trace(" looking for a parralax " + data.parallax );
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
			createEnvironment( environment );
		}
		
		private function createEnvironment( display:Environment ):void
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
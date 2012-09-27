package vs.course
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

	public class CourseControl 
	{
		protected var core:CourseCore;
		
		protected var atlusLoader:LoaderMax; 				//these guys are causing a memory leak
		protected var creationTexutureLoader:LoaderMax;		//these guys are causing a memory leak
		
		protected var environmentLoader:LoaderMax;			//these guys are causeing a memory leak
		protected var landscapeLoader:LoaderMax;			//these guys are causeing a memory leak
		
		 //we will be moving this into the model
		
		public function CourseControl( core:CourseCore = null )
		{
			if ( core != null ) this.core = core;
		}
		
		public function execute ():void
		{
			var max:int = this.core.creationList.length;
			for ( var i:int = 0; i < max; i++ )
			{
				var creation:Creation = this.core.creationList[ i ];
				creation.breath();
			}
		}
		
		public function updateDepths ():void
		{
			this.core.creationList.sortOn("y", Array.NUMERIC );
		}
		
		public function updateFocus ( x:Number, y:Number ):void
		{
			this.core.focus.x = x;
			this.core.focus.y = y;
		}
		
		public function get creationAmount ():int { return this.core.creationList.length }
		
		public function environment ( src:String = null ):void
		{
			loadEnvironment( src );	
		}
		
		public function landscape ( src:String, parallax:Number = 1,  y:Number = 0, layer:int = 0 ):void
		{
			var landscape:LandscapeLayer = updateLandscape ();
			landscape.parallax = parallax;
			landscape.y			= y;
			landscape.layer 	= layer;
			
			loadLandscapeLayer( src, landscape.id );
		}
		
		public function creation ( type:String, x:Number = 0, y:Number = 0, exist:Creation = null ):Creation
		{
			var creation:Creation = updateCreation ( type, exist );
			if ( creation == null ) return null;
			creation.course = this.core.self;
			creation.setUp();
			creation.x = x;
			creation.y = y;
			
			if( this.core.atlusTexture[ creation.textureLocation ] == null ) 
			{
				if ( creation.atlasLocation != null ) loadAtlus( creation.atlasLocation, creation.id ); 
				return creation;
			}
			
			creation.atlas = this.core.atlusTexture[ creation.textureLocation ]
			addCreation ( creation );
			
			return creation;
		}
		
		public function updateLandscape ():LandscapeLayer
		{
			var landscapeLayer:LandscapeLayer = new LandscapeLayer;
			this.core.landscape[ landscapeLayer.id ] = landscapeLayer;
			this.core.landscapeList.push( this.core.landscape[ landscapeLayer.id ] );  
			return this.core.landscape[ landscapeLayer.id ];
		}
		
		private function updateTexture ( src:String ):Texture
		{
			if ( this.core.texture[ src ] != null ) return  this.core.texture[ src ];
			
			var texture:Texture = textureFromBitmapData( this.core.bitmapData[ src ] ) ;
			if ( texture == null ) return null;
			
			this.core.texture[ src ] = texture;
			this.core.textureList.push(  this.core.texture[ src ]   );
			return this.core.texture[ src ];
		}
		
		private function updateCreation ( type:String, exist:Creation = null ):Creation
		{
			var creation:Creation;
			
			if (exist == null ) creation = dynamicCreation ( type );
			if (exist != null ) creation = exist;
			
			if ( creation == null ) return null;
			creation.awake();
			this.core.creations[ creation.id ] = creation;
			creation.courseIndex = this.core.creationList.length;
			this.core.creationList.push( this.core.creations[ creation.id ] );
			
			return creation;
		}
		
		public function updateAtlus( id:String, texture:Texture, atlus:XML ):TextureAtlas
		{
			var  texAt:TextureAtlas = new TextureAtlas( texture, atlus );
			this.core.atlusTexture[ id ] = texAt;
			this.core.atlusTextureList.push( this.core.atlusTexture[ id ] );  
			return this.core.atlusTexture[ id ];
		}
		
		public function updateEnvironment( id:String, src:String ):Environment
		{
			var texture:Texture = updateTexture( src );
			if ( texture == null ) return null;
			var environment:Environment = new Environment( texture ) ;
			this.core.environment[ id ] = environment;
			this.core.environmentList.push( this.core.environment[ id ] );  
			return this.core.environment[ id ];
		}
		
		private function updateBitmap ( id:String, bitmap:Bitmap ):BitmapData
		{
			var bitmapData:BitmapData	= new BitmapData( bitmap.width, bitmap.height , true, 0xFFFFFF );
			bitmapData.draw( bitmap );
			return updateBitmapData ( id, bitmapData );
		}
		
		private function updateBitmapData ( id:String, data:BitmapData ):BitmapData
		{
			return this.core.bitmapData[ id ] = data;
		}
		
		private function loadEnvironment( url:String ):void
		{
			if ( this.environmentLoader == null ) this.environmentLoader = new LoaderMax( { onChildComplete:loadEnvironmentComplete } );
			environmentLoader.append( new ImageLoader( url ) ); 	
			environmentLoader.load( false );
		}
		
		private function loadEnvironmentComplete ( event:LoaderEvent = null ):void  
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			updateBitmap ( loader.url, loader.content.rawContent );
			
			var environment:Environment = updateEnvironment( "FOR THE MOMENT THERE CAN BE ONLY ONE", loader.url );
			addEnvironment( environment );
		}
		
		public function destroy ():void
		{
			//empty all the holders--
			var i:int = 0;
			var max:int = 0;
			
			max = this.core.environmentList.length;
			for ( i = 0; i < max; i++ )
			{
				var environ:Environment = this.core.environmentList[ i ];
				environ.dispose();
			}
			
			this.core.environmentList = null;
			this.core.environment = null;
			
			max = this.core.atlusTextureList.length;
			for ( i = 0; i < max; i++ )
			{
				var at:TextureAtlas = this.core.atlusTextureList[ i ];
				at.dispose();
			}
			
			this.core.atlusTextureList 	= null;
			this.core.atlusTexture 		= null;
			
			max = this.core.textureList.length;
			for ( i = 0; i < max; i++ )
			{
				var texture:Texture = this.core.textureList[ i ];
				texture.dispose();
			}
			
			this.core.textureList = null;
			this.core.texture = null;
			
			
			this.core.bitmapData 				= null;
			this.core.creationLocation 			= null;
			this.core.landscape 				= null;
			this.core.texture					= null;
			this.core.creations 				= null;
			this.core.atlus						= null;
			
			if ( environmentLoader != null )
			{
				environmentLoader.unload()
				environmentLoader.dispose();
				environmentLoader    = null;
			}
			
			atlusLoader							= null;
			creationTexutureLoader				= null;
			landscapeLoader						= null;
			
			this.core = null;
		}
		
		public function updateCreationLocation ( location:String ):void 
		{
			this.core.creationLocation = location 
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.core.width 	= width;
			this.core.height 	= height;
		}
		
		private function loadAtlus ( url:String, id:String ):void
		{
			if ( this.atlusLoader == null ) this.atlusLoader = new LoaderMax( { onChildComplete:loadAtlusComplete } );
			
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
			var loader:ImageLoader = ImageLoader( event.target ); 
			if ( loader.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			var bitmap:BitmapData 		= updateBitmap ( loader.url, loader.rawContent );
			var creation:Creation 		= this.core.creations[ loader.name ];
			var atlus:XML				= this.core.atlus[ creation.atlasLocation ];
			
			var texture:Texture	= updateTexture( loader.url ); 
			var textureAtlus:TextureAtlas = updateAtlus( loader.url, texture, atlus );
			
			creation.atlas = textureAtlus;
			addCreation ( creation );
		}
		
		private function addCreation ( creation:Creation ):void
		{
			creation.course = this.core.self;
			this.core.self.addCreation( creation );
		}
		
		public function removeCreation ( creation:Creation ):void
		{
			this.core.creationList.splice( creation.courseIndex, 1 );
			delete this.core.creations[ creation.id ];
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
			
			updateBitmap ( loader.url, loader.content.rawContent );
			var layer:LandscapeLayer = this.core.landscape[ loader.name ]; 
			layer.updateTextures(  updateTexture( loader.url ) , updateTexture( loader.url )  );
			
			this.core.self.addLandscape( layer );
		}
		
		private function addEnvironment( display:Environment ):void
		{
			if ( core.self == null ) return;
			core.self.addEnvironment( display );
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
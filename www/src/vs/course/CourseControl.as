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
	
	import vs.Cosmos;
	import vs.Creation;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.LandscapeLayer;
	import vs.creation.core.elements.CreationSurface;

	public class CourseControl 
	{
		protected var core:CourseCore;
		
		public function CourseControl( core:CourseCore = null )
		{
			if ( core != null ) this.core = core;
		}
		
		public function destroy ():void
		{
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
			
			max = this.core.creationList.length;
			for ( i = 0; i < max; i++ )
			{
				var creation:Creation = this.core.creationList[ i ];
				this.core.self.removeCreation( creation );
				creation.destroy();
				creation.nuke();
			}
			
			this.core.creationLocation 			= null;
			this.core.landscape 				= null;
			
			this.core.creations 				= null;
			
			this.core.cosmos					= null;
			this.core = null;
		}
		
		public function execute ():void
		{
			var max:int = this.core.creationList.length;
			for ( var i:int = 0; i < max; i++ )
			{
				var creation:Creation = this.core.creationList[ i ];
				if ( creation == null ) return;
				creation.execute();
			}
		}
		
		// something is really enificent here
		public function collisionCheck ():void
		{
			var max:Number = this.core.creationList.length;
			
			if ( max <= 1 ) return;
			var count:Number = 0;
			
			for ( count = 0; count < max; count++ )
			{
				var source:Creation = this.core.creationList[ count ];
				for ( var b:int = 0; b < max; b++ )
				{
				var target:Creation = this.core.creationList[ b ];
				
				if ( target == null ) continue
				if ( source == null ) continue
				
				if ( target.id == source.id ) continue;
				
				if ( source.collideCheck( target ) == true ) source.collide( target );
				
				}
			}
		}
		
		public function updateCosmos ( cosmos:Cosmos ):void { this.core.cosmos = cosmos;}
		
		public function updateDepths ():void {	this.core.creationList.sortOn("y", Array.NUMERIC );	}
		
		public function updateFocus ( x:Number, y:Number ):void
		{
			this.core.focus.x = x;
			this.core.focus.y = y;
		}
		
		public function get creationAmount ():int { return this.core.creationList.length }
		
		public function environment ( src:String = null ):void	{	this.core.cosmos.loadEnvironment( src );	}
		
		public function landscape ( src:String, id:String, parallax:Number = 1,  y:Number = 0, layer:int = 0 ):void
		{
			var landscape:LandscapeLayer;
			
			if ( this.core.landscape[ id ] 	!= null )	landscape = this.core.landscape[ id ];
			
			if ( this.core.landscape[ id ] 	== null )
			{
				landscape = new LandscapeLayer;
				this.core.landscape[ id ] = landscape;
				this.core.landscapeList.push( this.core.landscape[ id ] );
			}
				
			landscape.parallax 	= parallax;
			landscape.y			= y;
			landscape.layer 	= layer;
			
			this.core.cosmos.loadLandscape( src, id );
			9173850587
		}
		
		public function creation ( surface:CreationSurface, x:Number = 0, y:Number = 0 ):Creation
		{
			var creation:Creation;
			if ( surface.creation != null )		creation = surface.creation; 
			if ( surface.type != null ) 		creation = dynamicCreation ( surface.type );
			
			if ( creation == null ) return null;
		
			creation.awake();
			this.core.creations[ creation.id ] = creation;
			creation.courseIndex = this.core.creationList.length;
			this.core.creationList.push( this.core.creations[ creation.id ] );
			
			creation.course = this.core.self;
			creation.setUp();
			creation.x = x;
			creation.y = y;
			
			if ( surface.atlas != null ) 				creation.atlasLocation 		= surface.atlas;
			if ( surface.texture != null )				creation.textureLocation 	= surface.texture;
			if ( ( creation.textureLocation != null ) ) this.core.cosmos.loadCreationTexture( creation.textureLocation, creation.id );
	
			return creation;
		}
		
		public function creationTextureDone ( id:String ):void
		{
			var creation:Creation = this.core.creations[ id ];
			
			if ( creation == null ) return;
			if ( creation.atlasLocation == null ) return
			this.core.cosmos.loadAtlus( creation.atlasLocation, id );
		}
		
		public function updateCreationAtlus( id:String, atlus:TextureAtlas ):void
		{
			var creation:Creation = this.core.creations[ id ];
			if ( creation == null ) return;
			creation.atlas = atlus;
			creation.course = this.core.self;
			this.core.self.addCreation( creation );
		}
		
		public function updateEnvironment( id:String, texture:Texture ):Environment
		{
			var environment:Environment = new Environment( texture ) ;
			this.core.environment[ id ] = environment;
			this.core.environmentList.push( this.core.environment[ id ] );
			
			core.self.viewEnvironment( this.core.environment[ id ] );
			
			return this.core.environment[ id ];
		}
		
		public function loadCreationTexture		( url:String, id:String, init:Boolean = false ):void	{	this.core.cosmos.loadCreationTexture(  url, id, init ); }
		public function loadEnvironment 		( src:String, init:Boolean ):void 						{	this.core.cosmos.loadEnvironment( src, init );		}
		public function loadLandscape			( src:String, id:String, init:Boolean = false ):void	{	this.core.cosmos.loadLandscape( src, id, init );	}
		
		public function updateLandscape ( id:String, texture1:Texture, texture2:Texture ):LandscapeLayer
		{
			var layer:LandscapeLayer = this.core.landscape[ id ]; 
			layer.updateTextures(  texture1 , texture2  );
			core.self.viewLandscape( layer );
			return layer;
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
		
		public function updateCreationLocation ( location:String ):void 
		{
			this.core.creationLocation = location 
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.core.width 	= width;
			this.core.height 	= height;
		}
		
		public function removeCreation ( creation:Creation ):void
		{
			if ( creation.id == null ) return;
			if ( this.core.creations[ creation.id ] == null ) return
			
			var max:int 	= this.core.creationList.length;
			var index:int	= 0; 
			for ( var i:int = 0; i < max; i++ )
			{
				var source:Creation = this.core.creationList[ i ];
				if ( source == null ) continue;
				if ( creation.id == null ) continue;
				if ( source.id == creation.id ) index = i;
			}
				
			this.core.creationList.splice( index, 1 );
			delete this.core.creations[ creation.id ];
			
			trace("creation amount = " + this.core.creationList.length );
		}
		
		private function dynamicCreation ( type:String ):Creation
		{
			var creation:Creation;
			var classInstance:Class;
			
			if ( this.core.creationLocation == null ) 
			{
				trace(" Creation Location needs to be defined ");
				return null;
			}
				
			var def:String = this.core.creationLocation + type;
			
			try 
			{
				classInstance = getDefinitionByName( this.core.creationLocation + type ) as Class;
				creation = new classInstance;
			}
			catch (error:Error) { trace( error.toString() );	}
			
			return creation;
		}
		
	}
}
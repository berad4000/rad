package vs.cosmos
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.core.LoaderCore;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import vs.Course;
	import vs.course.content.environment.Environment;

	public class CosmosControl
	{
		protected var core:CosmosCore;
		
		protected var atlusLoader:LoaderMax; 			//these guys are causing a memory leak
		protected var creationTexutureLoader:LoaderMax;	//these guys are causing a memory leak
		
		protected var environmentLoader:LoaderMax; 		//these guys are causeing a memory leak
		protected var landscapeLoader:LoaderMax;		//these guys are causeing a memory leak
		
		protected var initLoaders:Vector.<LoaderCore>;
		
		public function CosmosControl( core:CosmosCore )
		{
			this.core = core;
		}
		
		public function execute():void
		{
			if ( this.core.course != null ) this.core.course.execute()
			
			//need to create an interactive expierence
				
			//what did that do
			//this goal is to try to get your thoughts out
				
			//Goal is to make sure all the assets are there ready to go
			//Keep the hands moving
			//Number one rule keep the hands moving
			//Taking thought stuff and poured it out into the word
			
			//Mechanism for loading assest and display progress related to the load
			
			//you need a load course functionality
			//loads all the assets related to a course
			//sends out an event when they have finished loading
			//disposes of loaders when completely done
			
			//the game off was coming up
			//the month of november
			//he must win
			//if he won his place in the pecking order would increase
			//an increase in his pecking position meant lower blood pressure
			//an increase in his position meant a larger socail network
			//an increase ment a better looking mate
			//he must win
			//in order to win he must stop biting his fingernails
			
			//we wish to load all the assets at one time
			//keep track of when that is done
			//start the system
				
			//trace( "loaded " + this.environmentLoader.bytesLoaded + " total " + this.environmentLoader.bytesTotal );
		}
		
		public function loadCourse ( course:Course ):void
		{
			trace("you attempting to load the course ?? " + course );
			
			if ( this.core.stage == null ) return;
			
			
			initLoaders = new Vector.<LoaderCore>;
			
			course.load();
			
			this.core.stage.addEventListener( Event.ENTER_FRAME, checkLoadCourseComplete );
			
			//go to start loading the assets
		}
		
		private function checkLoadCourseComplete ( event:Event ):void
		{
			var total:Number = 0;
			var current:Number = 0;
			
			if ( atlusLoader 			!= null ) 	current += atlusLoader.bytesLoaded;
			if ( creationTexutureLoader != null ) 	current += creationTexutureLoader.bytesLoaded;
			if ( environmentLoader 		!= null ) 	current += environmentLoader.bytesLoaded;
			if ( landscapeLoader 		!= null ) 	current += landscapeLoader.bytesLoaded;
			
			if ( atlusLoader != null ) 				total 	+= atlusLoader.bytesTotal;
			if ( creationTexutureLoader != null ) 	total 	+= creationTexutureLoader.bytesTotal;
			if ( environmentLoader != null ) 		total 	+= environmentLoader.bytesTotal;
			if ( landscapeLoader != null ) 			total 	+= landscapeLoader.bytesTotal;	//these guys are causing a memory leak
			
			trace( "total " + total + "     " + " current " + current );
			if ( current < total ) return;
			
			this.core.stage.removeEventListener( Event.ENTER_FRAME, checkLoadCourseComplete );
			
			atlusLoader 			= null;
			creationTexutureLoader 	= null;	
			environmentLoader 		= null; 		
			landscapeLoader 		= null;
			
			trace(" check load is complete " );
		}
		
		public function updateStage ( stage:Stage ):void	{	this.core.stage = stage;	}
		
		//BITMAP AND TEXTURE MANAGEMENT
		private function updateTexture ( src:String ):Texture
		{
			if ( this.core.texture[ src ] != null ) return  this.core.texture[ src ];
			
			var texture:Texture = textureFromBitmapData( this.core.bitmapData[ src ] ) ;
			if ( texture == null ) return null;
			
			this.core.texture[ src ] = texture;
			this.core.textureList.push(  this.core.texture[ src ]   );
			
			return this.core.texture[ src ];
		}
		
		private function textureFromBitmapData( data:BitmapData ):Texture 
		{
			return Texture.fromBitmapData(data, true, false, core.scaleFactor);
		}
		
		private function textureFromBitmap( data:Bitmap ):Texture 
		{
			return  Texture.fromBitmap(data, true, false, core.scaleFactor);
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
		
		//CREATION BEGIN
		public function loadCreationTexture( url:String, id:String, init:Boolean = false ):void
		{
			if ( ( this.core.bitmapData[ url ] != null ) && ( init == false ) )
			{
				this.core.course.creationTextureDone( id );
				return;
			}
			
			if ( (  creationTexutureLoader == null ) && ( init == false ) )  	creationTexutureLoader = new LoaderMax( { onChildComplete:loadCreationTextureComplete 		} );
			if ( (  creationTexutureLoader == null ) && ( init == true  ) )  	creationTexutureLoader = new LoaderMax( { onChildComplete:loadCreationTextureCompleteInit 	} );
			
			creationTexutureLoader.append( new ImageLoader( url, { name:id }  ) ); 	
			creationTexutureLoader.load( false );
		}
		
		//texture and atlus file names always have to be the same
		private function loadCreationTextureComplete ( event:LoaderEvent = null ):void
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			if ( loader.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			updateBitmap( loader.url, loader.rawContent );
			
			this.core.course.creationTextureDone( loader.name );
		}
		
		private function loadCreationTextureCompleteInit ( event:LoaderEvent = null ):void
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			initLoaders.push( loader );
			if ( loader.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			updateBitmap( loader.url, loader.rawContent );
		}
		
		public function loadAtlus ( url:String, id:String ):void
		{
			if ( this.core.atlus[ url ] != null ) 
			{
				createAtlus ( url, id );
				return;
			}
			
			if ( this.atlusLoader == null ) this.atlusLoader = new LoaderMax( { onChildComplete:loadAtlusComplete } );
			atlusLoader.append( new XMLLoader( url, { name:id }  ) ); 	
			atlusLoader.load( false );
		}
		
		private function loadAtlusComplete ( event:LoaderEvent ):void
		{
			var loader:XMLLoader = XMLLoader( event.target ); 
			var xml:XML =  loader.content;
			this.core.atlus[ loader.url ] = xml; 
			
			var atlus:XML				= this.core.atlus[ loader.url ];
			if ( atlus == null ) return;
			
			var url:String = loader.url;
			
			createAtlus ( loader.url, loader.name );
			
			//loadCreationTexture( creation
			//var creation:Creation = this.core.creations[ loader.name ];
			//loadCreationTexture( creation.textureLocation , creation.id );
		}
		
		private function createAtlus ( url:String, id:String ):void
		{
			var atlus:XML				= this.core.atlus[ url ];
			if ( atlus == null ) return;
			
			var split:Array = url.split( "." );
			var textureLoc:String = split[ 0 ] + ".png";
			
			var texture:Texture				= updateTexture( textureLoc );
			var textureAtlus:TextureAtlas 	= updateAtlus( url, texture, atlus );
			
			this.core.course.updateCreationAtlus( id, textureAtlus );
		}
		
		public function updateAtlus( id:String, texture:Texture, atlus:XML ):TextureAtlas 
		{
			if ( this.core.atlusTexture[ id ] != null ) return this.core.atlusTexture[ id ];
			
			var  texAt:TextureAtlas = new TextureAtlas( texture, atlus );
			this.core.atlusTexture[ id ] = texAt;
			this.core.atlusTextureList.push( this.core.atlusTexture[ id ] );  
			
			return this.core.atlusTexture[ id ];
		}
		//CREATION END
		
		//LANDSCAPE BEGIN
		public function loadLandscape ( src:String, id:String, init:Boolean = false ):void
		{
			if ( ( landscapeLoader == null ) && ( init == false ) ) landscapeLoader = new LoaderMax( { onChildComplete:loadLandscapeLayerComplete 		} );
			if ( ( landscapeLoader == null ) && ( init == true ) )  landscapeLoader = new LoaderMax( { onChildComplete:loadLanscapeLayerCompleteInit 	} );
			
			landscapeLoader.append( new ImageLoader( src, { name:id }  ) ); 	
			landscapeLoader.load( false );
		}
		
		private function loadLanscapeLayerCompleteInit ( event:LoaderEvent ):void
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			initLoaders.push( loader );
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			updateBitmap ( loader.url, loader.content.rawContent );
		}
		
		private function loadLandscapeLayerComplete(  event:LoaderEvent ):void
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			loader.dispose( true );
			
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			
			updateBitmap ( loader.url, loader.content.rawContent );
			this.core.course.updateLandscape( loader.name,  updateTexture( loader.url ),  updateTexture( loader.url ) );
		}
		
		//LANDSCAPE END
		
		//ENVIRONMENT CREATION BEGIN
		public function loadEnvironment( src:String, init:Boolean = false ):void
		{
			//if ( this.core.bitmapData[ src ] != null )
			//{
			//	createEnvironment( src );
			//	return;
			//}
			
			//starting coment out
			if ( ( this.environmentLoader == null ) && ( init == false ) ) this.environmentLoader = new LoaderMax( { onChildComplete:loadEnvironmentComplete } );
			if ( ( this.environmentLoader == null ) && ( init == true  ) ) this.environmentLoader = new LoaderMax( { onChildComplete:loadEnvironmentCompleteInit } );
			
			
			environmentLoader.append( new ImageLoader( src ) );  	
			environmentLoader.load( false );
		}
		
		private function loadEnvironmentComplete ( event:LoaderEvent = null ):void  
		{
			var loader:ImageLoader = ImageLoader( event.target ); 
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			updateBitmap ( loader.url, loader.content.rawContent );
			createEnvironment( loader.url  );
			
			loader.dispose( true );
			
			///addEnvironment( environment );
		}
		
		private function loadEnvironmentCompleteInit ( event:LoaderEvent = null ):void  
		{
			trace("load eviron init complete " );
			
			var loader:ImageLoader = ImageLoader( event.target ); 
			initLoaders.push( loader );
			if ( loader.content.rawContent is Bitmap == false ) return; //only uses bitmap content
			updateBitmap ( loader.url, loader.content.rawContent );
		}
		
		private function createEnvironment( src:String ):void
		{
			var texture:Texture = updateTexture( src );
			if ( texture == null ) return;
			if ( this.core == null ) return
			
			if ( this.core.course == null ) return
					
			this.core.course.updateEnvironment( "FOR THE MOMENT THERE CAN BE ONLY ONE", texture );
		}
		
		private function addEnvironment( display:Environment ):void
		{
			//if ( core.self == null ) return;
			//core.self.addEnvironment( display );
		}
		//ENVIRONMENT CREATION END
		
		public function setupCourse ( course:Course ):void
		{
			var newCourse:Course = course;
			
			newCourse.awake();
			newCourse.creationLocation = this.core.creationLocation;
			this.core.cosmos.addCourse( newCourse );
		}
		
		public function course ( type:String ):void
		{
			var newCourse:Course = dynamicCourse ( type );
			
			if ( newCourse == null ) return
			setupCourse( newCourse );
		}
		
		private function dynamicCourse ( type:String ):Course 
		{
			var course:Course;
			var classInstance:Class;
			
			var def:String = this.core.courseLocation + type;
			
			try { classInstance = getDefinitionByName( def ) as Class;	}
			catch (error:Error) { trace( error.toString() );			}
			
			course = new classInstance;
			return course;
		}
	}
}
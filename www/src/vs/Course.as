package vs
{
	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import vs.course.CourseContent;
	import vs.course.CourseControl;
	import vs.course.CourseCore;
	import vs.course.cause.CourseEvent;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.Landscape;
	import vs.course.content.landscape.LandscapeLayer;
	import vs.creation.core.elements.CreationSurface;

	public class Course
	{
		public var content:CourseContent;
		
		protected var core:CourseCore;
		protected var control:CourseControl;
		
		protected var environmentDisplay:Environment; 	//not really sure why this is here--should be in content
		protected var landscapeDisplay:Landscape; 		//dont really like this
		
		public function Course(){}
		
		public function get creationList ():Array { return this.core.creationList }
		
		public function load ():void { }
		
		public function execute ( ):void
		{
			if ( this.landscapeDisplay != null ) this.landscapeDisplay.action();
			this.control.execute();
			
			//this.control.updateDepths();
			//this.content.execute();
		}
		
		public function createCourseEvent ( type:String, creation:Creation ):void	{	this.content.dispatchEvent( new CourseEvent( type, creation ) );	}
		
		public function set cosmos ( cos:Cosmos ):void					{ this.control.updateCosmos( cos )  }
		public function get cosmos ():Cosmos							{ return this.core.cosmos			}
		
		public function collideCheck ():void 							{ this.control.collisionCheck() 	}
		
		public function updateFocus ( x:Number, y:Number ):void 		{ this.control.updateFocus( x, y );}
		
		public function get creationAmount ():int 						{ return this.control.creationAmount }
		
		public function set creationLocation ( location:String ):void  	{ control.updateCreationLocation( location )  }
		
		public function environment 		( src:String ):void { this.control.environment( src )  	};
		public function loadEnvironment 	( src:String, init:Boolean = false ):void { control.loadEnvironment( src, init ) }
		public function updateEnvironment	( id:String, texture:Texture 					):Environment 				{ return this.control.updateEnvironment	( id, texture ) }
		
		public function landscape 			( src:String, id:String, parallax:Number = 1,  y:Number = 0, layer:int = 0 ):void 			{ this.control.landscape( src, id, parallax, y, layer ) 	};
		public function loadLandscape		( src:String, id:String, init:Boolean = false ):void 										{ this.control.loadLandscape(src, id, init ) 				};
		public function updateLandscape		( id:String, texture1:Texture, texture2:Texture ):LandscapeLayer							{ return this.control.updateLandscape	( id, texture1, texture2 ) }	
		
		public function creation			( surface:CreationSurface, x:Number = 0, y:Number = 0 ):Creation 							{ return this.control.creation( surface, x, y ) }
		public function loadCreationTexture	( url:String, id:String, init:Boolean = false ):void										{	this.core.cosmos.loadCreationTexture(  url, id, init ); }
		
		//Just because your awake does not mean you are going to appear
		public function awake ( core:CourseCore = null, control:CourseControl = null, content:CourseContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			if ( core 		== null ) 	this.core 		= new CourseCore;
			if ( control	== null ) 	this.control	= new CourseControl( this.core );
			if ( content	== null )
			{
				this.content	= new CourseContent;
				this.content.awake( this.core, this.control );
			}
				
			if ( this.core != null ) this.core.self = this;
		}
		
		public function destroy():void
		{
			this.control.destroy();
			if ( this.content.contains( environmentDisplay ) ) this.content.removeChild( environmentDisplay );
			content 	= null;
			core 		= null;
			control 	= null;
		}
		
		public function appear():void 
		{
			//content.addEventListener( Event.ENTER_FRAME, execute );
		}
		
		public function addCauses():void 
		{
			//this.control.addEventListener( CauseEnvironment.ADD, addEnvironment );
		}
		
		public function addCreation ( creation:Creation ):void
		{
			if ( creation.content == null ) 	return
			if ( this.content == null ) 		return
				
			if ( creation.parent != null ) trace("it has a parent");
			
			this.content.addChild( creation.content );
			creation.appear();
			Starling.juggler.add( creation.content );
			createCourseEvent( CourseEvent.ADD_CREATION, creation );
			// feel like this needs to go into the content
		}
		
		
		public function removeCreation ( creation:Creation ):void
		{
			this.control.removeCreation( creation );
			createCourseEvent( CourseEvent.REMOVE_CREATION, creation );
			this.content.removeChild( creation.content );
			Starling.juggler.remove( creation.content );
			creation.destroy();
			creation.nuke();
		}
		
		public function addLandscape ( layer:LandscapeLayer ):void
		{
			//if ( landscapeDisplay == null ) 
			//{
			//	landscapeDisplay = new Landscape;
			//	landscapeDisplay.awake( this.core, this.control );
			//	content.addChild( landscapeDisplay );
			//}
				
			//landscapeDisplay.addLayer( layer );
		}
		
		public function viewLandscape( display:LandscapeLayer ):void
		{
			if ( landscapeDisplay == null ) 
			{
				landscapeDisplay = new Landscape;
				landscapeDisplay.awake( this.core, this.control );
				content.addChild( landscapeDisplay );
			}
			
			landscapeDisplay.addLayer( display );
		}
		
		public function viewEnvironment ( display:Environment ):void
		{
			environmentDisplay = display;
			content.addChildAt( environmentDisplay, 0 );
		}
		
		public function creationTextureDone ( id:String ):void
		{
			this.control.creationTextureDone( id );
		}
		
		public function updateCreationAtlus( id:String, atlus:TextureAtlas ):void
		{
			this.control.updateCreationAtlus( id, atlus );
		}
		
	}
}
package vs
{
	import flash.display.Stage;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class Cosmos
	{
		public var content:CosmosContent; 
		
		protected var core:CosmosCore; 
		protected var control:CosmosControl; 
		
		public function Cosmos()
		{
		}
		
		public function start ():void
		{
			if (this.content == null ) return
			this.content.addEventListener( Event.ENTER_FRAME, go );	
			Starling.current.start();
		}
		
		public function stop():void
		{
			this.content.removeEventListener( Event.ENTER_FRAME, go );
			Starling.current.stop();
		}
		
		public function go ( event:Event):void
		{
			this.control.execute();
		}
		
		public function set stage ( value:Stage ):void	{	this.control.updateStage( value );	}
		
		public function get course ():Course { return this.core.course }
		public function setUpCourse ( course:Course ):void { this.control.setupCourse( course ) }
		//Creation
		public function loadAtlus(   url:String, id:String ):void				{ this.control.loadAtlus( url, id ) 			}
		public function loadCreationTexture ( url:String, id:String, init:Boolean = false ):void 		{ this.control.loadCreationTexture( url, id, init ) 	}
		
		//Course
		public function loadCourse ( course:Course ):void { this.control.loadCourse( course ) }
		
		public function addCourse ( course:Course ):void
		{
			if( this.core.course != null ) this.content.removeChild( this.core.course.content );
			if( this.core.course != null ) this.core.course.destroy();
			if( this.core.course != null ) this.core.course = null;
			
			course.cosmos = this;
			this.core.course = course;
			course.appear();
			this.content.addChild( course.content );
		}
		
		//Environment
		public function loadEnvironment 	( src:String, init:Boolean = false ):void				{	this.control.loadEnvironment( src, init 	);		}
		public function loadLandscape		( src:String, id:String, init:Boolean = false ):void	{	this.control.loadLandscape( src, id, init 	);		}
		
		
		public function awake ( core:CosmosCore = null, control:CosmosControl = null, content:CosmosContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			if ( this.core != null ) this.core.cosmos = this;
		}
		
		public function appear():void 
		{
			
		}
	}
}
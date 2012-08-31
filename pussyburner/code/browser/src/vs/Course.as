package vs
{
	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.Texture;
	
	import vs.course.cause.CauseEnvironment;
	import vs.course.content.CourseContent;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.Landscape;
	import vs.course.content.landscape.LandscapeLayer;
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;

	public class Course
	{
		public var content:CourseContent;
		
		protected var core:CourseCore;
		protected var control:CourseControl;
		
		protected var environmentDisplay:Environment; 
		protected var landscapeDisplay:Landscape; 
		
		public function Course(){}
		
		public function set creationLocation ( location:String ):void  { control.updateCreationLocation( location )  }
		
		public function environment ( src:String ):void { this.control.environment( src )  	};
		public function landscape 	( src:String, parallax:Number = 1,  y:Number = 0, layer:int = 0 ):void { this.control.landscape( src, parallax, y, layer ) 	};
		
		public function awake ( core:CourseCore = null, control:CourseControl = null, content:CourseContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			if ( this.core != null ) this.core.cosmos = this;
			
			appear();
		}
		
		public function destroy():void
		{
			trace("destroying the course   ----- ");
			this.control.destroy();
			
			if ( this.content.contains( environmentDisplay ) ) this.content.removeChild( environmentDisplay );
		}
		
		public function appear():void 
		{
			content.addEventListener( Event.ENTER_FRAME, execute );
		}
		
		public function addCauses():void 
		{
			//this.control.addEventListener( CauseEnvironment.ADD, addEnvironment );
			
		}
		
		public function addCreation ( creation:Creation ):void
		{
			trace("looking for a creation " + creation );
			creation.appear();
			this.content.addChild( creation.content );
			Starling.juggler.add( creation.content ); 
		}
		
		public function addLandscape ( layer:LandscapeLayer ):void
		{
			if ( landscapeDisplay == null ) 
			{
				landscapeDisplay = new Landscape;
				landscapeDisplay.awake( this.core, this.control );
				content.addChild( landscapeDisplay );
			}
				
			landscapeDisplay.addLayer( layer );
		}
		
		public function addEnvironment ( display:Environment ):void
		{
			environmentDisplay = display;
			content.addChildAt( environmentDisplay, 0 );
		}
		
		private function execute ( event:Event ):void
		{
			if ( this.landscapeDisplay != null ) this.landscapeDisplay.action();
		}
		
	}
}
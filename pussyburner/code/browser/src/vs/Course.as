package vs
{
	import starling.core.Starling;
	import starling.events.Event;
	
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
		
		public function execute ( ):void
		{
			if ( this.landscapeDisplay != null ) this.landscapeDisplay.action();
			this.control.execute();
			
			this.control.updateDepths();
			this.content.execute();
		}
		
		public function updateFocus ( x:Number, y:Number ):void { this.control.updateFocus( x, y );}
		
		public function get creationAmount ():int { return this.control.creationAmount }
		
		public function set creationLocation ( location:String ):void  { control.updateCreationLocation( location )  }
		
		public function creation	( src:String, x:Number, y:Number ):Creation { return  this.control.creation( src, x, y ) }
		public function environment ( src:String ):void { this.control.environment( src )  	};
		public function landscape 	( src:String, parallax:Number = 1,  y:Number = 0, layer:int = 0 ):void { this.control.landscape( src, parallax, y, layer ) 	};
		
		public function awake ( core:CourseCore = null, control:CourseControl = null, content:CourseContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			if ( this.core != null ) this.core.self = this;
			
			appear();
		}
		
		public function destroy():void
		{
			trace("destroying the course   ----- ");
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
			creation.appear();
			this.content.addChild( creation.content );
			Starling.juggler.add( creation.content );
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
		
		public function addEnvironment ( display:Environment ):void
		{
			trace("adding an environment " + display );
			//environmentDisplay = display;
			//content.addChildAt( environmentDisplay, 0 );
		}
		
	}
}
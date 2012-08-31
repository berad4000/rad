package vs.course.content
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	import vs.course.cause.CauseEnvironment;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.Landscape;
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;
	
	public class CourseContent extends Sprite
	{
		protected var core:CourseCore;
		protected var control:CourseControl;
		
		public function CourseContent()
		{
		}
		
		public function awake( core:CourseCore, control:CourseControl ):void
		{
			trace("just looking for a core " + core );
			trace("just loooking for a control " + control );
			
			this.core 		= core;
			this.control 	= control;
			appear();
			addCauses();
		}
		
		public function addCauses():void {}
		
		public function appear():void {}
		
		public function removeCauses():void {}
		
		public function execute ( event:Event = null ):void	{}
		public function action ():void						{}
	}
}
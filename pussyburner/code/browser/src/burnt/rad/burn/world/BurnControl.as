package burnt.rad.burn.world
{
	import flash.events.EventDispatcher;
	
	import vs.Soul;
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;

	public class BurnControl extends EventDispatcher
	{
		protected var model:BurnModel; 
		
		public function  BurnControl( model:BurnModel )
		{
			this.model = model; 
		}
	}
}
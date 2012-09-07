package burnt.rad.burn.world
{
	import flash.events.EventDispatcher;
	
	import burnt.z-unused.Soul;
	import vs.course.CourseControl;
	import vs.course.CourseCore;

	public class BurnControl extends EventDispatcher
	{
		protected var model:BurnModel; 
		
		public function  BurnControl( model:BurnModel )
		{
			this.model = model; 
		}
	}
}
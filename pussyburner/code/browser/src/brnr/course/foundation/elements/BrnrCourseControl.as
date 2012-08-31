package brnr.course.foundation.elements
{
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;

	public class BrnrCourseControl extends CourseControl
	{
		
		protected var brnCore:BrnrCourseCore;
		
		public function BrnrCourseControl( core:BrnrCourseCore )
		{
			this.brnCore = core;
			super( this.brnCore );
		}
	}
}
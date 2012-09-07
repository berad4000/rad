package brnr.course.foundation.elements
{
	import vs.course.CourseControl;
	import vs.course.CourseCore;

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
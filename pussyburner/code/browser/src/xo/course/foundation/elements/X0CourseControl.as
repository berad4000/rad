package xo.course.foundation.elements
{
	import vs.course.CourseControl;
	import vs.course.CourseCore;

	public class X0CourseControl extends CourseControl
	{
		
		protected var brnCore:X0CourseCore;
		
		public function X0CourseControl( core:X0CourseCore )
		{
			this.brnCore = core;
			super( this.brnCore );
		}
	}
}
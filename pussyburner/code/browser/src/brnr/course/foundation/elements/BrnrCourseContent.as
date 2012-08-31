package brnr.course.foundation.elements
{
	import vs.course.content.CourseContent;
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;

	public class BrnrCourseContent extends CourseContent
	{
		public function BrnrCourseContent()
		{
		}
		
		override public function awake(core:CourseCore, control:CourseControl):void
		{
			super.awake( core, control );
		}
	}
}
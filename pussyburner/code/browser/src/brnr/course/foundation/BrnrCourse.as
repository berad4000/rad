package brnr.course.foundation
{
	
	import brnr.course.foundation.elements.BrnrCourseContent;
	import brnr.course.foundation.elements.BrnrCourseControl;
	import brnr.course.foundation.elements.BrnrCourseCore;
	import brnr.creation.form.Horse;
	
	import starling.events.Event;
	
	import vs.Course;
	import vs.course.content.CourseContent;
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;
	

	public class BrnrCourse extends Course
	{
		
		protected var brnrCore:BrnrCourseCore;
		protected var brnrControl:BrnrCourseControl;
		protected var brnrContent:BrnrCourseContent;
		
		protected var horse:Horse; //needs to go into a library
		
		public function BrnrCourse()
		{
			
		}
		
		override public function awake( core:CourseCore=null, control:CourseControl=null, content:CourseContent=null ):void
		{
			this.brnrCore  							= new BrnrCourseCore;
			this.brnrControl 						= new BrnrCourseControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as BrnrCourseContent;
			if ( content == null ) this.brnrContent = new BrnrCourseContent;
			
			trace( "BRN CORE " 		+ this.brnrCore    );
			trace( "BRN CONTROL " 	+ this.brnrControl );
			trace( "BRN CONTENT " 	+ this.brnrContent );
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
			this.creationLocation = "brnr.creation.form."; // needs to be moved into the COSMOS
		}
	}
}
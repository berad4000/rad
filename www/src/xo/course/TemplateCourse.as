package xo.course
{
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import vs.Course;
	import vs.Creation;
	import vs.creation.core.elements.CreationSurface;
	
	import xo.course.foundation.X0Course;
	import xo.creation.X0CreationLibrary;
	import xo.creation.TemplateCreation;
	import xo.creation.foundation.X0Creation;

	public class TemplateCourse extends Course
	{
		public function TemplateCourse(){}
		
		
		override public function appear():void
		{
			super.appear();
			
			if ( this.core != null ) this.core.creationLocation =  "xo.creation.form.";
			
			this.environment("content/screenShot.jpg" );
			
			var thing:Creation =  this.creation( new CreationSurface( new xo.creation.TemplateCreation, "content/network.png", "content/network.xml" ) );
			
		}
		
	}
}
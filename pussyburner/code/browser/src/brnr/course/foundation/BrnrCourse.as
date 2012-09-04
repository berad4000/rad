package brnr.course.foundation
{
	
	import brnr.course.foundation.elements.BrnrCourseContent;
	import brnr.course.foundation.elements.BrnrCourseControl;
	import brnr.course.foundation.elements.BrnrCourseCore;
	import brnr.creation.form.Horse;
	
	import starling.display.Sprite;
	
	import vs.Course;
	import vs.Creation;
	import vs.course.content.CourseContent;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.Landscape;
	import vs.course.content.landscape.LandscapeLayer;
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
		override public function addLandscape(layer:LandscapeLayer):void
		{
			if ( landscapeDisplay == null ) 
			{
				landscapeDisplay = new Landscape; 
				landscapeDisplay.awake( this.core, this.control );
				brnrContent.backgroundLayer.addChild( landscapeDisplay );
			}
			
			landscapeDisplay.addLayer( layer );
		}
		
		override public function addEnvironment(display:Environment):void
		{
			
			super.addEnvironment( display );
			trace("Environmet " + display );
			this.brnrContent.environment.addChild( display );
		}
		
		override public function addCreation ( creation:Creation ):void
		{
			super.addCreation( creation );
			this.brnrContent.creationLayer.addChild( creation.content );
		}
		
		override public function awake( core:CourseCore=null, control:CourseControl=null, content:CourseContent=null ):void
		{
			this.brnrCore  							= new BrnrCourseCore;
			this.brnrControl 						= new BrnrCourseControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as BrnrCourseContent;
			if ( content == null ) this.brnrContent = new BrnrCourseContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
			this.creationLocation = "brnr.creation.form."; // needs to be moved into the COSMOS
		}
	}
}
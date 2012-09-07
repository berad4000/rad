package brnr.course.foundation
{
	
	import brnr.course.foundation.elements.BrnrCourseContent;
	import brnr.course.foundation.elements.BrnrCourseControl;
	import brnr.course.foundation.elements.BrnrCourseCore;
	import brnr.creation.form.z.HorseOLD;
	import brnr.creation.foundation.objects.BrnrCreationType;
	
	import starling.display.Sprite;
	
	import vs.Course;
	import vs.Creation;
	import vs.course.CourseContent;
	import vs.course.CourseControl;
	import vs.course.CourseCore;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.Landscape;
	import vs.course.content.landscape.LandscapeLayer;
	

	public class BrnrCourse extends Course
	{
		
		protected var brnrCore:BrnrCourseCore;
		protected var brnrControl:BrnrCourseControl;
		protected var brnrContent:BrnrCourseContent;
		
		protected var horse:HorseOLD; //needs to go into a library
		
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
			if ( creation.parent == null )  				this.brnrContent.creationLayer.addChild( creation.content 	);
			if ( creation.parent != null )					creation.parent.content.addChild( creation.content 			);
			if ( creation.type == BrnrCreationType.FOCUS ) 	this.brnrContent.uiLayer.addChild( creation.content 		);
				
		}
		
		override public function removeCreation ( creation:Creation ):void
		{
		
			if ( creation.parent == null )  				this.brnrContent.creationLayer.removeChild( creation.content 	);
			if ( creation.parent != null )					creation.parent.content.removeChild( creation.content 			);
			if ( creation.type == BrnrCreationType.FOCUS ) 	this.brnrContent.uiLayer.removeChild( creation.content 			);
				
			super.removeCreation( creation );
		}
	
		override public function awake( core:CourseCore=null, control:CourseControl=null, content:CourseContent=null ):void
		{
			this.brnrCore  							= new BrnrCourseCore( this );
			this.brnrControl 						= new BrnrCourseControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as BrnrCourseContent;
			if ( content == null ) this.brnrContent = new BrnrCourseContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
			this.creationLocation = "brnr.creation.form."; // needs to be moved into the COSMOS
		}
	}
}
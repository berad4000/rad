package xo.course.foundation
{
	
	import xo.course.foundation.elements.X0CourseContent;
	import xo.course.foundation.elements.X0CourseControl;
	import xo.course.foundation.elements.X0CourseCore;
	import xo.creation.form.z.HorseOLD;
	import xo.creation.foundation.objects.X0CreationType;
	
	import starling.display.Sprite;
	
	import vs.Course;
	import vs.Creation;
	import vs.course.CourseContent;
	import vs.course.CourseControl;
	import vs.course.CourseCore;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.Landscape;
	import vs.course.content.landscape.LandscapeLayer;
	

	public class X0Course extends Course
	{
		
		protected var brnrCore:X0CourseCore;
		protected var brnrControl:X0CourseControl;
		protected var brnrContent:X0CourseContent;
		
		protected var horse:HorseOLD; //needs to go into a library
		
		public function X0Course()
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
			if ( creation.type == X0CreationType.FOCUS ) 	this.brnrContent.uiLayer.addChild( creation.content 		);
				
		}
		
		override public function removeCreation ( creation:Creation ):void
		{
		
			if ( creation.parent == null )  				this.brnrContent.creationLayer.removeChild( creation.content 	);
			if ( creation.parent != null )					creation.parent.content.removeChild( creation.content 			);
			if ( creation.type == X0CreationType.FOCUS ) 	this.brnrContent.uiLayer.removeChild( creation.content 			);
				
			super.removeCreation( creation );
		}
	
		override public function awake( core:CourseCore=null, control:CourseControl=null, content:CourseContent=null ):void
		{
			this.brnrCore  							= new X0CourseCore( this );
			this.brnrControl 						= new X0CourseControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as X0CourseContent;
			if ( content == null ) this.brnrContent = new X0CourseContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
			this.creationLocation = "brnr.creation.form."; // needs to be moved into the COSMOS
		}
	}
}
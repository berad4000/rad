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
		
		protected var xoCore:X0CourseCore;
		protected var xoControl:X0CourseControl;
		protected var xoContent:X0CourseContent;
		
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
				xoContent.backgroundLayer.addChild( landscapeDisplay );
			}
			
			landscapeDisplay.addLayer( layer );
		}
		
		override public function viewEnvironment(display:Environment):void
		{
			super.viewEnvironment( display );
			this.xoContent.environment.addChild( display );
		}
		
		override public function addCreation ( creation:Creation ):void
		{
			super.addCreation( creation );
			//if ( creation.parent == null )  				this.brnrContent.creationLayer.addChild( creation.content 	);
			//if ( creation.parent != null )				creation.parent.content.addChild( creation.content 			);
			//if ( creation.type == X0CreationType.FOCUS ) 	this.brnrContent.uiLayer.addChild( creation.content 		);
				
		}
		
		override public function removeCreation ( creation:Creation ):void
		{
		
			if ( creation.parent == null )  				this.xoContent.creationLayer.removeChild( creation.content 	);
			if ( creation.parent != null )					creation.parent.content.removeChild( creation.content 			);
			if ( creation.type == X0CreationType.FOCUS ) 	this.xoContent.uiLayer.removeChild( creation.content 			);
				
			super.removeCreation( creation );
		}
	
		override public function awake( core:CourseCore=null, control:CourseControl=null, content:CourseContent=null ):void
		{
			this.xoCore  							= new X0CourseCore( this );
			this.xoControl 						= new X0CourseControl(  this.xoCore );
			if ( content != null ) this.xoContent = content as X0CourseContent;
			if ( content == null ) this.xoContent = new X0CourseContent;
			
			super.awake( this.xoCore, this.xoControl, this.xoContent );
			this.xoContent.awake( this.xoCore, this.xoControl );
			
			this.creationLocation = "brnr.creation.form."; // needs to be moved into the COSMOS
		}
	}
}
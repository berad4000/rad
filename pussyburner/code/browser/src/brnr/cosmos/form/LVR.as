package brnr.cosmos.form
{
	import brnr.cosmos.foundation.BrnrCosmos;
	import brnr.course.CourseLibrary;
	import brnr.creation.CreationLibrary;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;
	import vs.creation.content.CreationContent;

	public class LVR extends BrnrCosmos
	{
		
		protected var courses:CourseLibrary 		= new CourseLibrary;
		protected var creations:CreationLibrary 	= new CreationLibrary;
		
		public function LVR()
		{
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			super.awake( core, control, content );
			this.control.course( "PlasticJesus" );
			//this.content.addEventListener( TouchEvent.TOUCH, touch );
		}
		
		private function touch ( event:TouchEvent ):void
		{
			
		}
	}
}
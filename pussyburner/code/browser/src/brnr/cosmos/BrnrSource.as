package brnr.cosmos
{
	import brnr.cosmos.foundation.BrnrCosmos;
	import brnr.course.CourseLibrary;
	import brnr.creation.CreationLibrary;
	
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class BrnrSource extends BrnrCosmos
	{
		
		protected var courses:CourseLibrary 		= new CourseLibrary;
		protected var creations:CreationLibrary 	= new CreationLibrary;
		
		public function BrnrSource()
		{
		}
		
		public function tryAgain ():void
		{
			this.control.course( "StartStage" );
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			super.awake( core, control, content );
			this.control.course( "StartStage" );
		}
	}
}
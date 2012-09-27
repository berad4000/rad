package xo.cosmos.form
{
	import xo.cosmos.foundation.X0Cosmos;
	import xo.course.X0CourseLibrary;
	import xo.creation.X0CreationLibrary;
	
	import starling.events.TouchEvent;
		
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class X0X0 extends X0Cosmos
	{
		
		protected var courses:X0CourseLibrary 		= new X0CourseLibrary;
		protected var creations:X0CreationLibrary 	= new X0CreationLibrary;
		
		public function X0X0()
		{
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			super.awake( core, control, content );
			this.control.course( "PlasticJesus" );   
			this.content.addEventListener( TouchEvent.TOUCH, touch );
		}
		
		private function touch ( event:TouchEvent ):void
		{
			
		}
	}
}
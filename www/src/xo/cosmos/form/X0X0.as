package xo.cosmos.form
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.events.TouchEvent;
	
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;
	
	import xo.cosmos.foundation.X0Cosmos;
	import xo.course.TemplateCourse;
	import xo.course.X0CourseLibrary;
	import xo.course.form.CollideTest;
	import xo.course.form.Demo;
	import xo.course.form.LoadTest;
	import xo.course.form.Profile;
	import xo.creation.X0CreationLibrary;

	public class X0X0 extends X0Cosmos
	{
		
		protected var courses:X0CourseLibrary 		= new X0CourseLibrary;
		protected var creations:X0CreationLibrary 	= new X0CreationLibrary;
		
		protected var timer:Timer = new Timer( 1000 );
		
		public function X0X0()
		{
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			super.awake( core, control, content );
			
			//timer.start();
			timer.addEventListener( TimerEvent.TIMER, add );
			
			//this.setUpCourse( new LoadTest );
		}
		
		override public function appear():void
		{
			trace("apppearing ");
			trace("looking for stage " + this.core.stage );
			var test:CollideTest = new CollideTest;
			test.awake();
			test.cosmos = this;
			this.addCourse( test );
		}
		
		private function add ( event:TimerEvent ):void
		{
			
		}
		
		private function touch ( event:TouchEvent ):void
		{
			
		}
	}
}
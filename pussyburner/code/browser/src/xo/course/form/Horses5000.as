package xo.course.form
{
	import xo.course.foundation.X0Course;
	import xo.creation.form.z.HorseOLD;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Horses5000 extends X0Course
	{
		
		public function Horses5000(){}
		
		protected var startTime:Number = 3000;
		protected var timer:Timer = new Timer ( startTime );
		
		protected var max:int = 1;
		
		protected var startX:Number = -300;
		protected var startY:Number = 0;
	 	protected var xPos:Number = startX;
		protected var yPos:Number = startY;
		protected var w:Number = 30;
		protected var h:Number = 10;
		
		protected var count:int = 0;
		
		override public function appear():void
		{
			//super.appear();
			
			//this.environment( "media/studio.png" );
			
			//this.landscape("media/icon.png", .2, 320 );
			//this.landscape("media/icon.png", .3, 330 );
			//this.landscape("media/icon.png", .1, 300 ); // still needs layers
			
			//timer.addEventListener( TimerEvent.TIMER, phase1 );
			//timer.start();
			//this.control.create( CosmosType.ENVIRONMENT, "media/hiRezBanner.png" );
		}
		
		private function phase1( event:TimerEvent ):void
		{
			//startTime *= .8;
			//timer.delay = startTime;
			//execute();
		}
		
		//private function execute ( event:TimerEvent= null ):void
		//{
			//for ( var i:int = 1; i <= max; i++ )
			//{
			//	this.control.creation("Horse", xPos, yPos );
			//	count +=1;
			//	xPos += w;
			//	if ( xPos > 1000)
			//	{
			//		xPos =  startX;
			//		yPos += h;
					
			//	}
				
			//	if ( yPos > 500 )
			//	{
			//		xPos =  startX;
			//		yPos = startY;
			//	}
			//}
			
			//trace(count);
		//}
	}
}
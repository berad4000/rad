package xo.course.form
{
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import vs.Course;
	import vs.Creation;
	import vs.creation.core.elements.CreationSurface;
	
	import xo.course.foundation.X0Course;
	import xo.creation.X0CreationLibrary;
	import xo.creation.foundation.X0Creation;

	public class Profile extends Course
	{
		public function Profile(){}
		
		protected var avatar1:X0Creation;
		protected var avatar2:X0Creation;
		protected var avatar3:X0Creation;
		
		protected var xPos:Number = 0;
		protected var yPos:Number = 0;
		
		protected var max:Number = 5000;
		
		protected var timer:Timer 			= new Timer( 100 );
		protected var removeTimer:Timer	 	= new Timer( 200 );
		
		private var list:Array = new Array;
		
		//32 last time i checked
		
		override public function appear():void
		{
			super.appear();
			
			if ( this.core != null ) this.core.creationLocation =  "xo.creation.form.";
			
			this.environment("content/screenShot.jpg" );
			this.landscape( "content/network.png" , "nativlyServer"	);
			
			//timer.addEventListener( TimerEvent.TIMER, add );
			//timer.start();
			
			//removeTimer.addEventListener( TimerEvent.TIMER, remove );
			//removeTimer.start();
		}
		
		private function add ( event:TimerEvent = null ):void
		{
			xPos += 10;
			var thing:Creation =  this.creation( new CreationSurface( new Creation, "content/network.png", "content/network.xml" ), xPos, yPos );
			
			list.push( thing );
			
			if ( xPos > this.core.width * .7 ) 
			{
				xPos = 0;
				yPos += 20;
			}
			
			if ( yPos > this.core.height )
			{
				yPos = 0;
			}
		}
		
		private function remove ( event:TimerEvent = null ):void
		{
			var thing:Creation = list.shift();
			if ( thing == null ) return;
			this.removeCreation( thing );
		}
		
		override public function destroy():void
		{
			timer.removeEventListener( TimerEvent.TIMER, add );
			timer.stop();
			timer = null;
			
			super.destroy();
		}
		
		override public function execute():void
		{
			remove();
			add();
			
			super.execute();
		}
	
	}
}
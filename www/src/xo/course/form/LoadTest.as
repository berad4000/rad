package  xo.course.form
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import vs.Course;
	import vs.Creation;
	import vs.creation.core.elements.CreationSurface;
	
	import xo.course.foundation.X0Course;
	import xo.creation.TemplateCreation;
	import xo.creation.X0CreationLibrary;
	import xo.creation.form.Dragger;
	import xo.creation.foundation.X0Creation;

	public class LoadTest extends Course
	{
		public function LoadTest(){}
		
		private var timer:Timer = new Timer( 300 );
		
		override public function appear():void
		{
			super.appear();
			
			if ( this.core != null ) this.core.creationLocation =  "xo.creation.form.";
			
			//this.environment("content/screenShot.jpg" );
			//this.timer.addEventListener( TimerEvent.TIMER, go );
			//timer.start();
		}
		
		override public function load():void
		{
			this.loadEnvironment("content/screenShot.jpg", true );
			this.loadLandscape( "content/layer.jpg" , "nativlyServer", true	);
			this.loadCreationTexture("content/network.png", "need this no", true );
		}
		
		override public function execute():void
		{
			super.execute();
		}
		
		private function go ( event:TimerEvent ):void
		{
			var max:int = 1;
			
			for ( var i:int = 0; i < max; i++ )
			{
				var surface:CreationSurface = new CreationSurface( new Dragger, "content/network.png", "content/network.xml" );
				var x:Number 	= Math.random() * this.core.width	 	*.5 + 100;
				var y:Number	= Math.random() * 300 + 100;
				this.creation( surface, x , y  );
			}
			
		}
		
	}
}
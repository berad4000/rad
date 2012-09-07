package
{
	import com.greensock.TweenMax;
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import xo.cosmos.form.X0X0;
	import xo.cosmos.foundation.X0Cosmos;
	import xo.cosmos.foundation.elements.X0CosmosContent;
	
	import starling.core.Starling;
	import starling.events.Event;

	public class Goal
	{
		
		private var mStarling:Starling;
		
		protected var cosmos:X0Cosmos;
		protected var content:X0CosmosContent;
		
		public function Goal( stage:Stage )
		{
			cosmos = new X0X0;
			
			TweenMax.to({}, 0.001, {}); 
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true; // useful on mobile devices
			Starling.handleLostContext = true; // required on Android
			
			var viewPort:Rectangle = new Rectangle();
			
			viewPort.height = 800;
			viewPort.width 	= 1280;
			
			mStarling = new Starling( X0CosmosContent, stage, viewPort, null, "auto", "baseline" );
			mStarling.simulateMultitouch  = false;
			mStarling.enableErrorChecking = false;
			mStarling.start();
			
			mStarling.addEventListener( Event.ROOT_CREATED, rootCreated );
			mStarling.showStats = true;
		}
		
		private function rootCreated ( event:Event ):void
		{
			if ( Starling.current.stage.getChildAt( 0 ) is X0CosmosContent ) content = Starling.current.stage.getChildAt( 0 ) as X0CosmosContent;
			
			if ( content == null ) return;
			
			this.cosmos.awake( null, null, content );
			this.cosmos.start();
		}
	}
}
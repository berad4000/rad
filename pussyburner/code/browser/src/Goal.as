package
{
	import com.greensock.TweenMax;
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import brnr.cosmos.form.LVR;
	import brnr.cosmos.foundation.BrnrCosmos;
	import brnr.cosmos.foundation.elements.BrnrCosmosContent;
	
	import starling.core.Starling;
	import starling.events.Event;

	public class Goal
	{
		
		private var mStarling:Starling;
		
		protected var cosmos:BrnrCosmos;
		protected var content:BrnrCosmosContent;
		
		public function Goal( stage:Stage )
		{
			cosmos = new LVR;
			
			TweenMax.to({}, 0.001, {}); 
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true; // useful on mobile devices
			Starling.handleLostContext = true; // required on Android
			
			var viewPort:Rectangle = new Rectangle();
			
			viewPort.height = 800;
			viewPort.width 	= 1280;
			
			mStarling = new Starling( BrnrCosmosContent, stage, viewPort, null, "auto", "baseline" );
			mStarling.simulateMultitouch  = false;
			mStarling.enableErrorChecking = false;
			mStarling.start();
			
			mStarling.addEventListener( Event.ROOT_CREATED, rootCreated );
			mStarling.showStats = true;
		}
		
		private function rootCreated ( event:Event ):void
		{
			if ( Starling.current.stage.getChildAt( 0 ) is BrnrCosmosContent ) content = Starling.current.stage.getChildAt( 0 ) as BrnrCosmosContent;
			
			if ( content == null ) return;
			
			this.cosmos.awake( null, null, content );
			this.cosmos.start();
		}
	}
}
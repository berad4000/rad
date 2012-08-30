package
{
	import brnr.cosmos.foundation.elements.BrnrCosmosContent;
	import brnr.cosmos.foundation.BrnrCosmos;
	
	import com.greensock.TweenMax;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import vs.Cosmos;
	import vs.cosmos.content.CosmosContent;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	[SWF(width='1000',height='548',backgroundColor='#FFFFFF',frameRate='60')]
	//[SWF(width="1280", height="800", frameRate="60", backgroundColor="#000000")]
	public class MAIN extends Sprite
	{
		private var mStarling:Starling;
		
		protected var cosmos:BrnrCosmos;
		protected var content:BrnrCosmosContent;
	
		public function MAIN()
		{
			cosmos = new BrnrCosmos;
			
			TweenMax.to({}, 0.001, {}); 
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true; // useful on mobile devices
			Starling.handleLostContext = true; // required on Android
			
			var viewPort:Rectangle = new Rectangle();
			
			viewPort.height = 800;
			viewPort.width 	= 1280;
			
			mStarling = new Starling( BrnrCosmosContent, stage, viewPort );
			mStarling.simulateMultitouch  = false;
			mStarling.enableErrorChecking = false;
			mStarling.start();
			
			mStarling.addEventListener( Event.ROOT_CREATED, rootCreated );
			mStarling.showStats = true;
			//NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}
		
		private function rootCreated ( event:Event ):void
		{
			if ( Starling.current.stage.getChildAt( 0 ) is BrnrCosmosContent ) content = Starling.current.stage.getChildAt( 0 ) as BrnrCosmosContent;
			
			if ( content == null ) return;
			
			this.cosmos = new BrnrCosmos;
			this.cosmos.awake( null, null, content );
		
			Starling.current.stage.addEventListener( Event.ENTER_FRAME, execute );
		}
		
		private function start ( event:Event ):void
		{
			
		}
		
		private function stop ( event:Event ):void
		{
			
		}
		
		private function execute ( event:Event ):void
		{
			
		}
		
	}
}
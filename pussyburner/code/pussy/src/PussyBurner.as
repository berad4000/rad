package
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Elastic;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.NativeProcess;
	import flash.desktop.SystemIdleMode;
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
	
	import rad.rad.burn.Miniverse;
	import rad.rad.burn.world.objects.BurnStat;
	import rad.rad.burn.world.souls.types.Babe;
	import rad.vs.soul.Soul;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	//[SWF(width='1000',height='548',backgroundColor='#FFFFFF',frameRate='60')]
	[SWF(width="1280", height="800", frameRate="30", backgroundColor="#000000")]
	public class PussyBurner extends Sprite
	{
		private var mStarling:Starling;
		
		protected var babe:Soul;
		
		private var _debugDisplay:TextField;
		
		private var _addUIcount:Number 		= 200;
		private var _currentCount:Number 	= 0;
		
		//needs object pooling
		protected var mini:Miniverse;
		
		protected var wetBar:WetBar = new WetBar;
		protected var climaxBar:ClimaxBar = new ClimaxBar;
		
		public function PussyBurner()
		{
			TweenMax.to({}, 0.001, {}); 
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true; // useful on mobile devices
			Starling.handleLostContext = true; // required on Android
			
			var viewPort:Rectangle = new Rectangle();
			
			viewPort.height = 800;
			viewPort.width 	= 1280;
			
			mStarling = new Starling( Miniverse, stage, viewPort);
			mStarling.simulateMultitouch  = false;
			mStarling.enableErrorChecking = false;
			mStarling.start();
			
			mStarling.addEventListener( Event.ROOT_CREATED, rootCreated );
			//mStarling.showStats = true;
			
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE; 
			
			this.addChild( wetBar );
			wetBar.x = 14;
			wetBar.y = -40;
			
			this.addChild( climaxBar );
			climaxBar.x = 1000;
			climaxBar.y = 235;
			
			climaxBar.visible = false;
		}
		
		private function rootCreated ( event:Event ):void
		{
			if ( Starling.current.stage.getChildAt( 0 ) is Miniverse ) mini = Starling.current.stage.getChildAt( 0 ) as Miniverse;
			
			if ( mini == null ) 			return;
			if ( mini.world == null ) 		return;
			if ( mini.world.model == null ) return;
			
			mini.world.view.addEventListener( Event.TRIGGERED, 	start );
			mini.world.view.addEventListener( Event.COMPLETE, 	stop );
			
			showUI();
			Starling.current.stage.addEventListener( Event.ENTER_FRAME, execute );
		}
		
		private function start ( event:Event ):void
		{
			if ( mini == null ) 			return;
			if ( mini.world == null ) 		return;
			if ( mini.world.model == null ) return;
			if ( mini.world.view.babe != null ) babe = mini.world.view.babe;
			
			
			trace("start");
			TweenMax.to( wetBar, 2,  { y: 10, delay:4, ease:Elastic.easeInOut }); 
		}
		
		private function stop ( event:Event ):void
		{
			TweenMax.to( wetBar, 1,  { y: -40, delay:2, ease:Elastic.easeInOut });
		}
		
		private function execute ( event:Event ):void
		{
			if ( babe == null ) return;
			var percentCore:Number = babe.statValue( BurnStat.CORE ) / babe.statMax(  BurnStat.CORE );
			if ( wetBar.wetBarMask != null ) wetBar.wetBarMask.scaleX = percentCore;
			
			var percentClimax:Number = babe.statValue( BurnStat.FRICTION ) / babe.statMax(  BurnStat.FRICTION );
			if ( climaxBar.climaxMask != null ) climaxBar.climaxMask.scaleX = percentClimax;
			
			if ( babe.statValue( BurnStat.FRICTION ) > 0 ) 	climaxBar.visible = false;
			if ( babe.statValue( BurnStat.FRICTION ) <= 0 ) climaxBar.visible = false;
			
			//_debugDisplay.text = " Core:" + babe.statValue( BurnStat.CORE ).toFixed( 2 ) ;
			//_debugDisplay.appendText( " Excite: " 	+ babe.statValue( BurnStat.EXCITE	).toFixed( 2 ) ) ;
			//_debugDisplay.appendText( " Friction: " + babe.statValue( BurnStat.FRICTION ).toFixed( 2 ) ) ;
			//_debugDisplay.appendText( " Climax: " 	+ babe.statValue( BurnStat.CLIMAX 	).toFixed( 2 ) ) ;
		}
		
		private function showUI (  ):void
		{
			_debugDisplay = new TextField;
			this.addChild( _debugDisplay );
			
			var fmt:TextFormat = new TextFormat(); 
			fmt.color = 0xFFFFFF; 
			fmt.font = "Arial";
			fmt.bold = true;
			fmt.size = 9;
			
			_debugDisplay.defaultTextFormat = fmt;
			_debugDisplay.autoSize = TextFieldAutoSize.LEFT;  
			_debugDisplay.text = "Data is no good";
			
			_debugDisplay.x -= 2;
			_debugDisplay.y -= 2;
			
			_debugDisplay.alpha = .3;
		}
	}
}
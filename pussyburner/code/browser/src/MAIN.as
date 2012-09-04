package
{
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import brnr.cosmos.form.PSSYLVR;
	import brnr.cosmos.foundation.BrnrCosmos;
	import brnr.cosmos.foundation.elements.BrnrCosmosContent;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	[SWF(width='1280',height='720',backgroundColor='#FFFFFF',frameRate='60')]
	//[SWF(width="1280", height="800", frameRate="60", backgroundColor="#000000")]
	public class MAIN extends Sprite
	{
		private var mStarling:Starling;
		
		protected var cosmos:BrnrCosmos;
		protected var content:BrnrCosmosContent;
		
		//protected var timer:Timer = new Timer( 65000 );
		
		protected var text:TextField = new TextField;
		
		protected var pause:Boolean = false;
	
		public function MAIN()
		{
			cosmos = new PSSYLVR;
			
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
			//NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			
			this.addChild( text );
			text.autoSize = TextFieldAutoSize.LEFT;
		}
		
		private function rootCreated ( event:Event ):void
		{1
			if ( Starling.current.stage.getChildAt( 0 ) is BrnrCosmosContent ) content = Starling.current.stage.getChildAt( 0 ) as BrnrCosmosContent;
			
			if ( content == null ) return;
			
			this.cosmos.awake( null, null, content );
			this.cosmos.start();
		
			Starling.current.stage.addEventListener( Event.ENTER_FRAME, execute );
			
			//this.stage.addEventListener( MouseEvent.MOUSE_UP, mouseUp );
			
			//timer.addEventListener( TimerEvent.TIMER, timerGO );
			//timer.start();
			
			this.addChild( text );
			//text.y = 160;
			text.textColor = 0xFFFFFF;
			
			var format:TextFormat = new TextFormat;
			format.bold = true
				
			text.defaultTextFormat = format;
			
		}
		
		private function timerGO ( event:TimerEvent ):void
		{
			//this.cosmos.tryAgain();  ..FOR MUYBRIDGE
		}
		
		private function mouseUp ( event:MouseEvent ):void
		{
			trace("you are mousing up");
			if ( pause )
			{
				pause = false;
				this.cosmos.stop();
				return
			}
			
			if ( !pause )
			{
				pause = true;
				this.cosmos.start();
			}
			
			//trace("mousing up mousing up mousing up " );
			//this.cosmos.tryAgain(); for muybrige
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
		
		private function muybridge ( event:Event ):void
		{
			text.text = this.cosmos.course.creationAmount + " Horses ";
			
			
			var value:Number = 0;
			value =  .05;
			//if ( this.cosmos.course.creationAmount <= 700 )  								1					value =  .05;
			//if ( this.cosmos.course.creationAmount > 700 )   	value =  .07;
			//if ( this.cosmos.course.creationAmount >= 1500 )  													value =  .15;
			var scale:Number = 1 + this.cosmos.course.creationAmount * value;
			trace(scale);
			text.scaleX = text.scaleY = scale;
			
			
			//if ( this.cosmos.course.creationAmount > 1000 ) text.y -= .55;
			
			//if (  text.y < 0 ) text.y = 0;
			
			//var xPos:Number = 0;
			////if ( this.cosmos.course.creationAmount < 300 ) xPos = .3;
			//if ( ( this.cosmos.course.creationAmount >= 300 ) && ( this.cosmos.course.creationAmount <= 500 ) ) xPos = 1;
			///if ( ( this.cosmos.course.creationAmount >= 500 ) && ( this.cosmos.course.creationAmount <= 1000 ) ) xPos = 2;
			//if ( ( this.cosmos.course.creationAmount >= 1000 ) && ( this.cosmos.course.creationAmount <= 1500 ) ) xPos = 2.5;
			//if ( ( this.cosmos.course.creationAmount >= 1500 ) && ( this.cosmos.course.creationAmount <= 2000 ) ) xPos = 6;
			//if ( ( this.cosmos.course.creationAmount >= 2000 ) && ( this.cosmos.course.creationAmount <= 3000 ) ) xPos = 8;
			
			//text.x -=  xPos;
			
		}
		
	}
}
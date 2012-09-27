package xo.creation.form.z
{
	import xo.creation.X0CreationLibrary;
	import xo.creation.foundation.X0Creation;
	import xo.creation.foundation.objects.X0Toon;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	
	public class Baddie extends X0Creation
	{
		
		public function Baddie(){}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"demo/bad.png";
			this.atlasLocation 		=	"demo/bad.xml";
		}
		
		override public function appear():void
		{
			this.addToon( X0Toon.IDLE, 24, true );
			this.toon = X0Toon.IDLE;1
			super.appear();
		}
		
	}
}
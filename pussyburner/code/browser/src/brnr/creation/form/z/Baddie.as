package brnr.creation.form.z
{
	import brnr.creation.CreationLibrary;
	import brnr.creation.foundation.BrnrCreation;
	import brnr.creation.foundation.objects.BrnrToon;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	
	public class Baddie extends BrnrCreation
	{
		
		public function Baddie(){}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"demo/bad.png";
			this.atlasLocation 		=	"demo/bad.xml";
		}
		
		override public function appear():void
		{
			this.addToon( BrnrToon.IDLE, 24, true );
			this.toon = BrnrToon.IDLE;1
			super.appear();
		}
		
	}
}
package brnr.creation.form
{
	import brnr.creation.foundation.BrnrCreation;
	import brnr.creation.foundation.elements.objects.BrnrToon;
	
	public class Bombshell extends BrnrCreation
	{
		public function Bombshell()
		{
			
		}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"media/queen/bombshell.png";
			this.atlasLocation 		=	"media/queen/bombshell.xml";
		}
		
		override public function appear():void
		{
			this.addToon( BrnrToon.IDLE, 24, true );
			this.toon = BrnrToon.IDLE;
			super.appear();
		}
		
	}
}
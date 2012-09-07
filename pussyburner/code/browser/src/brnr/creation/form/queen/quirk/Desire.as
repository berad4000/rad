package  brnr.creation.form.queen.quirk
{
	import brnr.creation.foundation.BrnrCreation;
	import brnr.creation.foundation.objects.BrnrToon;
	
	public class Desire extends BrnrCreation
	{
		public function Desire(){}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"media/horseToon.png";
			this.atlasLocation 		=	"media/horseToon.xml";
		}
		
		override public function appear():void
		{
			this.addToon( BrnrToon.IDLE, 24, true );
			this.toon = BrnrToon.IDLE;
			super.appear();
		}
		
	}
}
package brnr.creation.form.queen.toy
{
	import brnr.creation.foundation.BrnrCreation;
	import brnr.creation.foundation.objects.BrnrToon;
	
	public class Toy extends BrnrCreation
	{
		public function Toy(){}
		
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
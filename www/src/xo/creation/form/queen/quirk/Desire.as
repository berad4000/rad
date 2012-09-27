package  xo.creation.form.queen.quirk
{
	import xo.creation.foundation.X0Creation;
	import xo.creation.foundation.objects.X0Toon;
	
	public class Desire extends X0Creation
	{
		public function Desire(){}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"media/horseToon.png";
			this.atlasLocation 		=	"media/horseToon.xml";
		}
		
		override public function appear():void
		{
			this.addToon( X0Toon.IDLE, 24, true );
			this.toon = X0Toon.IDLE;
			super.appear();
		}
		
	}
}
package xo.creation.form.queen.toy
{
	import xo.creation.foundation.X0Creation;
	import xo.creation.foundation.objects.X0Toon;
	
	public class Toy extends X0Creation
	{
		public function Toy(){}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"media/horseToon.png";
			this.atlasLocation 		=	"media/horseToon.xml";
		}
		
		override public function appear():void
		{
			super.appear();
		}
		
	}
}
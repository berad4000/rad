package xo.creation.form.z
{
	import xo.creation.foundation.X0Creation;
	import xo.creation.foundation.objects.X0Toon;
	
	public class HorseOLD extends X0Creation
	{
		public function HorseOLD()
		{
			
		}
		
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
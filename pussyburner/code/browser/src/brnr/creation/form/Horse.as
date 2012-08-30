package brnr.creation.form
{
	import brnr.creation.foundation.BrnrCreation;
	import brnr.creation.foundation.elements.objects.BrnrToon;
	
	public class Horse extends BrnrCreation
	{
		public function Horse()
		{
			trace("horse has been created");
		}
		
		override public function setUp():void
		{
			this.core.textureLocation	=  	"media/icon.png";
			this.core.atlasLocation 	=	"media/icon.xml";
		}
		
		override public function appear():void
		{
			trace("make it rain ");
			this.addToon( BrnrToon.IDLE, 40, true );
			this.toon = BrnrToon.IDLE;
			super.appear();
		}
		
	}
}
package rad.vs.world.star
{
	import rad.rad.burn.world.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class BackgroundLayer extends Sprite
	{
		private var image1:Image;
		private var image2:Image;
		
		private var _parallax:Number;
		
		public function BackgroundLayer( file:String )
		{
			super();
			
			image1 = new Image(Assets.getTexture( file )); 
			image2 = new Image(Assets.getTexture( file ));
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			image1.x = 0;
			image2.x = image2.width - 1;
			
			this.addChild(image1);
			this.addChild(image2);
		}
		
		public function get parallax():Number
		{
			return _parallax;
		}

		public function set parallax(value:Number):void
		{
			_parallax = value;
		}
	}
}
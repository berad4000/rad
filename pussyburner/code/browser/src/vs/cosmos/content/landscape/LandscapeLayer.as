package vs.cosmos.content.landscape
{
	import burnt.rad.burn.world.Assets;
	
	import flash.display.BitmapData;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class LandscapeLayer extends Sprite
	{
		private var image1:Image;
		private var image2:Image;
		
		private var _parallax:Number;
		
		public function LandscapeLayer( texture1:Texture, texture2:Texture )
		{
			super();
			
			image1 = new Image( texture1 ); 
			image2 = new Image( texture2 );
			
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
			trace("you sould be setting the parallax " + parallax );
			_parallax = value;
		}
	}
}
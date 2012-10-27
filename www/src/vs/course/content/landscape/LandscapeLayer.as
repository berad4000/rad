package vs.course.content.landscape
{
	import com.laiyonghao.Uuid;
	
	import flash.display.BitmapData;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class LandscapeLayer extends Sprite
	{
		private var image1:Image;
		private var image2:Image;
		
		public var parallax:Number;
		public var layer:int = 0;
		public var id:String;
		
		public function LandscapeLayer(  )
		{
			super();
			
			var uuid:Uuid = new Uuid; 
			this.id = uuid.toString();
			
			this.addEventListener( starling.events.Event.ADDED_TO_STAGE, onAddedToStage );
		}
		
		public function updateTextures ( texture1:Texture, texture2:Texture ):void
		{
			image1 = new Image( texture1 ); 
			image2 = new Image( texture2 );
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			image1.x = 0;
			image2.x = image2.width - 1;
			
			this.addChild(image1);
			this.addChild(image2);
		}
	}
}
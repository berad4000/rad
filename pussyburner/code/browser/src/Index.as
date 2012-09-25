package
{
	import flash.display.Sprite;
	
	[SWF(width="1280", height="800", frameRate="60", backgroundColor="#000000")]
	public class Index extends Sprite
	{
		public function Index()
		{ 
			var goal:Goal = new Goal( this.stage );
		}
	}	
}
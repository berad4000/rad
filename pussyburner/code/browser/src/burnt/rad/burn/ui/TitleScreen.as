package burnt.rad.burn.ui
{

	import burnt.rad.burn.world.Assets;
	import burnt.rad.burn.world.graphics.UIAssets;
	
	import starling.display.Image;
	import starling.display.Sprite;

	public class TitleScreen extends Sprite
	{
		public function TitleScreen( )
		{
			this.addChild( new Image( Assets.getTextureFromClass( "LOGO", UIAssets ) ));
		}
		
	}
}
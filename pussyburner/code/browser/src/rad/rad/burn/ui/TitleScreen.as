package rad.rad.burn.ui
{

	import rad.rad.burn.world.Assets;
	import rad.rad.burn.world.graphics.UIAssets;
	
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
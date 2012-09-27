package burnt.z-unused.burn.world.elements
{
	import burnt.z-unused.burn.control.BurnControl;
	import burnt.z-unused.burn.model.BurnModelOLD;
	
	import starling.display.Sprite;

	public class WorldView extends Sprite
	{
		protected var model:BurnModelOLD;
		protected var control:BurnControl;
		
		public function WorldView( model:BurnModelOLD, control:BurnControl )
		{
			this.model = model;
			this.control = control;
		}
		
		public function awake ():void
		{
			
		}
		
		public function layout():void
		{
			
		}
		
		public function execute():void
		{
			
		}
	}
}
package rad.vs.world.star
{
	import rad.vs.soul.Soul;
	import rad.vs.world.VsControl;
	import rad.vs.world.VsModel;
	import rad.vs.world.WorldView;
	
	import starling.display.Sprite;

	public class StarWorld extends Sprite implements WorldView
	{
		
		protected var starModel:VsModel;
		protected var starControl:VsControl;
		
		public function StarWorld()
		{
			
		}
		
		public function awake( model:VsModel, control:VsControl ):void
		{
			this.starModel = model;
			this.starControl = control;
		}
		
		public function addSoul( soul:Soul ):void { }
	}
}
package rad.rad.burn.world
{
	import flash.events.EventDispatcher;
	
	import rad.vs.soul.Soul;
	import rad.vs.world.VsControl;
	import rad.vs.world.VsModel;

	public class BurnControl extends EventDispatcher
	{
		protected var model:BurnModel; 
		
		public function  BurnControl( model:BurnModel )
		{
			this.model = model; 
		}
	}
}
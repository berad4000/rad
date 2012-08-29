package burnt.rad.burn.world
{
	import flash.events.EventDispatcher;
	
	import vs.Creation;
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;

	public class BurnControl extends EventDispatcher
	{
		protected var model:BurnModel; 
		
		public function  BurnControl( model:BurnModel )
		{
			this.model = model; 
		}
	}
}
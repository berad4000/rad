package burnt.rad.burn.world
{
	import flash.events.EventDispatcher;
	
	import vs.creation.Soul;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class BurnControl extends EventDispatcher
	{
		protected var model:BurnModel; 
		
		public function  BurnControl( model:BurnModel )
		{
			this.model = model; 
		}
	}
}
package brnr.cosmos.foundation.elements
{
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;

	public class BrnrCosmosControl extends CosmosControl
	{
		
		protected var brnCore:BrnrCosmosCore;
		
		public function BrnrCosmosControl( core:BrnrCosmosCore )
		{
			this.core = core;
			super( this.core );
		}
	}
}
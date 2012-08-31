package brnr.cosmos.foundation.elements
{
	import vs.cosmos.CosmosControl;

	public class BrnrCosmosControl extends CosmosControl
	{
		protected var brnCore:BrnrCosmosCore;
		
		public function BrnrCosmosControl( core:BrnrCosmosCore )
		{
			this.brnCore = core;
			super( this.brnCore );
		}
	}
}
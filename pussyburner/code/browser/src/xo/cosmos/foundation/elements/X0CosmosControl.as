package xo.cosmos.foundation.elements
{
	import vs.cosmos.CosmosControl;

	public class X0CosmosControl extends CosmosControl
	{
		protected var brnCore:X0CosmosCore;
		
		public function X0CosmosControl( core:X0CosmosCore )
		{
			this.brnCore = core;
			super( this.brnCore );
		}
	}
}
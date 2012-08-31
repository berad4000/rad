package brnr.cosmos.foundation.elements
{
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class BrnrCosmosContent extends CosmosContent
	{
		public function BrnrCosmosContent()
		{
		}
		
		override public function awake(core:CosmosCore, control:CosmosControl):void
		{
			super.awake( core, control ); 
			trace("Awaking the COSMOS.");
		}
	}
}
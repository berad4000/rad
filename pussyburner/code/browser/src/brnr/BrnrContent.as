package brnr
{
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;
	import vs.starling.StarlingWorld;

	public class BrnrContent extends CosmosContent
	{
		public function BrnrContent()
		{
		}
		
		override public function awake(core:CosmosCore, control:CosmosControl):void
		{
			super.awake( core, control );
			
			trace("AWAKING THE BURNER CONTENT NOW GO TO WORK");
		}
	}
}
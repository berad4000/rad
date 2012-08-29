package vs.cosmos.content
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	import vs.cosmos.cause.CauseEnvironment;
	import vs.cosmos.content.environment.Environment;
	import vs.cosmos.content.landscape.Landscape;
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;
	
	public class CosmosContent extends Sprite
	{
		protected var core:CosmosCore;
		protected var control:CosmosControl;
		
		public function CosmosContent()
		{
		}
		
		public function awake( core:CosmosCore, control:CosmosControl ):void
		{
			this.core 		= core;
			this.control 	= control;
			appear();
			addCauses();
		}
		
		public function addCauses():void {}
		
		public function appear():void {}
		
		public function removeCauses():void {}
		
		public function execute ( event:Event = null ):void	{}
		public function action ():void						{}
	}
}
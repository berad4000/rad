package vs.starling
{
	import vs.creation.Soul;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;
	import vs.cosmos.CosmosContent;
	
	import starling.display.Sprite;

	public class StarlingWorld extends Sprite 
	{
		
		protected var starModel:CosmosCore;
		protected var starControl:CosmosControl;
		
		public function StarlingWorld()
		{
			
		}
		
		public function awake( model:CosmosCore, control:CosmosControl ):void
		{
			this.starModel = model;
			this.starControl = control;
		}
		
		public function addSoul( soul:Soul ):void { }
	}
}
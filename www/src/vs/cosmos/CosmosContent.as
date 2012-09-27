package vs.cosmos
{
	import starling.display.Sprite;

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
		public function action ():void {}		
	}
}
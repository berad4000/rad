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
		}
		
		//public function addSoul( soul:Soul ):void { }
	}
}
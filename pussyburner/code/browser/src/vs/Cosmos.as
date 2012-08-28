package vs
{
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class Cosmos
	{
		public var content:CosmosContent;
		
		protected var core:CosmosCore;
		protected var control:CosmosControl;
		
		public function Cosmos()
		{
		}
		
		public function awake ( core:CosmosCore = null, control:CosmosControl = null, content:CosmosContent = null ):void
		{
			
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			core.width 		= width;
			core.height 	= height;
		}
	}
}
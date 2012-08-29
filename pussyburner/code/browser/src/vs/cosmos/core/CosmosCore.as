package vs.cosmos.core
{
	import flash.utils.Dictionary;
	
	import vs.Cosmos;
	
	public class CosmosCore
	{
		public var cosmos:Cosmos;
		
		public var height:Number = 0;
		public var width:Number  = 1280;
		
		public var landscape:Dictionary = new Dictionary;
		
		public var textures:Dictionary = new Dictionary;
		public var scaleFactor:Number = 1;
		
		public function CosmosCore()
		{
		}
	}
}
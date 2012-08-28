package brnr
{
	import vs.Cosmos;
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class BrnrCosmos extends Cosmos
	{
		
		public function BrnrCosmos()
		{
			
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			if ( content != null ) this.content = content;
			
			this.core  = new BrnrCore;
			this.control = new BrnrControl;
			
			this.content.awake( this.core, this.control );
		}
		
		
	}
}
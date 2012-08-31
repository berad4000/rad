package brnr.cosmos.foundation
{
	import brnr.cosmos.foundation.elements.BrnrCosmosContent;
	import brnr.cosmos.foundation.elements.BrnrCosmosControl;
	import brnr.cosmos.foundation.elements.BrnrCosmosCore;
	
	import vs.Cosmos;
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class BrnrCosmos extends Cosmos
	{
		protected var brnrCore:BrnrCosmosCore;
		protected var brnrControl:BrnrCosmosControl;
		protected var brnrContent:BrnrCosmosContent;
		
		public function BrnrCosmos()
		{
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			this.brnrCore  		= new BrnrCosmosCore( this );
			this.brnrControl 	= new BrnrCosmosControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as BrnrCosmosContent;
			if ( content != null ) this.content = this.brnrContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
		}
	}
}
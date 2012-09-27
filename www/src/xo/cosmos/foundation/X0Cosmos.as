package xo.cosmos.foundation
{
	import xo.cosmos.foundation.elements.X0CosmosContent;
	import xo.cosmos.foundation.elements.X0CosmosControl;
	import xo.cosmos.foundation.elements.X0CosmosCore;
	
	import vs.Cosmos;
	import vs.cosmos.CosmosContent;
	import vs.cosmos.CosmosControl;
	import vs.cosmos.CosmosCore;

	public class X0Cosmos extends Cosmos
	{
		protected var brnrCore:X0CosmosCore;
		protected var brnrControl:X0CosmosControl;
		protected var brnrContent:X0CosmosContent;
		
		public function X0Cosmos()
		{
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			this.brnrCore  		= new X0CosmosCore( this );
			this.brnrControl 	= new X0CosmosControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as X0CosmosContent;
			
			if ( content != null ) this.content = this.brnrContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
		}
	}
}
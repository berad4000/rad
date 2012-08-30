package brnr.cosmos.foundation
{
	
	import brnr.cosmos.foundation.elements.BrnrCosmosContent;
	import brnr.cosmos.foundation.elements.BrnrCosmosControl;
	import brnr.cosmos.foundation.elements.BrnrCosmosCore;
	import brnr.creation.form.Horse;
	
	import starling.events.Event;
	
	import vs.Cosmos;
	import vs.cosmos.content.CosmosContent;
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;
	import vs.cosmos.core.object.CosmosType;

	public class BrnrCosmos extends Cosmos
	{
		
		protected var brnrCore:BrnrCosmosCore;
		protected var brnrControl:BrnrCosmosControl;
		protected var brnrContent:BrnrCosmosContent;
		
		protected var horse:Horse;
		
		public function BrnrCosmos()
		{
			
		}
		
		override public function awake(core:CosmosCore=null, control:CosmosControl=null, content:CosmosContent=null):void
		{
			this.brnrCore  		= new BrnrCosmosCore;
			this.brnrControl 	= new BrnrCosmosControl(  this.brnrCore );
			if ( content != null ) this.brnrContent = content as BrnrCosmosContent;
			if ( content != null ) this.content = this.brnrContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
			
			content.addEventListener( Event.ENTER_FRAME, execute );
		}
		
		private function execute ( event:Event ):void
		{
			if ( this.landscape != null ) this.landscape.action();
		}
		
		override public function appear():void
		{
			super.appear();
			
			this.control.createEnvironment( "media/studio.png", "xx" );
			this.control.creation("Horse");
			//this.control.create( CosmosType.ENVIRONMENT, "media/hiRezBanner.png" );
		}
		
	}
}
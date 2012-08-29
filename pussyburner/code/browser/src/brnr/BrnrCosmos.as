package brnr
{
	import brnr.cosmos.BrnrCosmosContent;
	import brnr.cosmos.BrnrCosmosControl;
	import brnr.cosmos.BrnrCosmosCore;
	
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
			
			//this.control.create( CosmosType.ENVIRONMENT, "media/hiRezBanner.png" );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "1", 1, 0 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "2", 2, 30 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "3", 3, 60 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "4", 4, 80 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "5", 3, 100 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "6", 2, 120 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "7", 1, 130 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "8", 2, 140 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "9", 3, 150 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "10", 4, 160 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "11", 5, 170 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "12", 6, 180 );
			this.control.createLandscapeLayer( "media/hiRezBanner.png", "13", 7, 200 );
			
		}
		
	}
}
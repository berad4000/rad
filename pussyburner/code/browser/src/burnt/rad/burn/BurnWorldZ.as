package burnt.rad.burn
{
	import burnt.rad.burn.world.Assets;
	import burnt.rad.burn.world.BurnControl;
	import burnt.rad.burn.world.BurnModel;
	import burnt.rad.burn.world.BurnWorld;
	import burnt.rad.burn.world.souls.types.Babe;
	import vs.Soul;
	import vs.cosmos.VsWorld;
	import vs.starling.StarlingWorld;
	
	import starling.display.Image;

	public class BurnWorldZ 
	{
		public var vs:VsWorld;
		
		public var model:BurnModel; 
		public var control:BurnControl;
		public var view:BurnWorld;
		
		public function BurnWorldZ()
		{
			
			this.model  	= new BurnModel;
			this.control 	= new BurnControl( this.model );
			this.view		= new BurnWorld( this.model, this.control );
			
			this.model.world = this;
		}
		
		public function addSoul ( soul:Soul ):void
		{
			
			//this.view.addSoul( soul );
		}
		
		public function awake():void
		{
			this.vs = new VsWorld;
			this.model.vs = this.vs;
			this.vs.awake();
			
			//THIS IS GIVING ME A DEVIL OF A TIME
			//this.vs.appear( this.view );
			
			//trace("devil of a time");
			//this.model.babe = new Soul( new Babe );
			//this.model.babe.x = 100;
			//this.model.babe.y = 100;
			//this.view.addSoul( this.model.babe ); 
		}
		
	}
}
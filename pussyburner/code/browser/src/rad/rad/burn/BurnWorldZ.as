package rad.rad.burn
{
	import rad.rad.burn.world.Assets;
	import rad.rad.burn.world.BurnControl;
	import rad.rad.burn.world.BurnModel;
	import rad.rad.burn.world.BurnWorld;
	import rad.rad.burn.world.souls.types.Babe;
	import rad.vs.soul.Soul;
	import rad.vs.world.VsWorld;
	import rad.vs.world.star.StarWorld;
	
	import starling.display.Image;

	public class BurnWorldZ 
	{
		public var vs:VsWorld;
		
		public var model:BurnModel; 
		public var control:BurnControl;
		public var view:BurnWorld;
		
		public function BurnWorldZ()
		{
			trace("INIT the BurnWorld ");
			this.model  	= new BurnModel;
			this.control 	= new BurnControl( this.model );
			this.view		= new BurnWorld( this.model, this.control );
			
			this.model.world = this;
		}
		
		public function addSoul ( soul:Soul ):void
		{
			trace("yes you are adding a soul ");
			//this.view.addSoul( soul );
		}
		
		public function awake():void
		{
			this.vs = new VsWorld;
			this.model.vs = this.vs;
			this.vs.awake();
			
			//THIS IS GIVING ME A DEVIL OF A TIME
			this.vs.appear( this.view );
			
			//trace("devil of a time");
			//this.model.babe = new Soul( new Babe );
			//this.model.babe.x = 100;
			//this.model.babe.y = 100;
			//this.view.addSoul( this.model.babe ); 
		}
		
	}
}
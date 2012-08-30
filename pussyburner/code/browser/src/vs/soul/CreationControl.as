package vs.soul
{
	import vs.Cosmos;
	import vs.soul.controls.CommandControl;
	import vs.soul.controls.ModeControl;
	import vs.soul.controls.StatControl;

	public class CreationControl
	{
		protected var core:CreationCore;
		
		public var stat:StatControl;
		public var command:CommandControl;
		public var mode:ModeControl;
		
		public function CreationControl( core:CreationCore  )
		{
			this.core = core;
			
			this.stat 		= new StatControl( this.core	);
			this.command 	= new CommandControl( this.core );
			this.mode 		= new ModeControl( this.core 	);
		}
		
		//public function updateCosmos	( cosmos:Cosmos ):void { this.core. = world;		 }
		//public function updateFocalX 	( value:Number  ):void { this.model.focalPoint.x = value;}
		//public function updateFocalY 	( value:Number  ):void { this.model.focalPoint.y = value;}
		
		
	}
}
package burnt.z-unused.soul
{
	import vs.Course;
	import burnt.z-unused.soul.controls.CommandControl;
	import burnt.z-unused.soul.controls.ModeControl;
	import burnt.z-unused.soul.controls.StatControl;

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
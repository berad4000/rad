package vs.creation
{
	import burnt.vs.creation.controls.CommandControl;
	import burnt.vs.creation.controls.ModeControl;
	import burnt.vs.creation.controls.StatControl;
	import vs.cosmos.VsWorld;

	public class SoulControl
	{
		protected var model:SoulModel;
		
		public var stat:StatControl;
		public var command:CommandControl;
		public var mode:ModeControl;
		
		public function SoulControl( model:SoulModel  )
		{
			this.model = model;
			
			this.stat 		= new StatControl( this.model	);
			this.command 	= new CommandControl( this.model );
			this.mode 		= new ModeControl( this.model 	);
		}
		
		public function updateWorld		( world:VsWorld ):void { this.model.world = world;		 }
		public function updateFocalX 	( value:Number  ):void { this.model.focalPoint.x = value;}
		public function updateFocalY 	( value:Number  ):void { this.model.focalPoint.y = value;}
		
		
	}
}
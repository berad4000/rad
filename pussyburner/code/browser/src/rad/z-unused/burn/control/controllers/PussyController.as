package rad.rad.burn.control.controllers
{
	import flash.events.EventDispatcher;
	
	import rad.rad.burn.control.BurnControl;
	import rad.rad.burn.model.BurnModelOLD;

	public class PussyController extends EventDispatcher
	{
		protected var model:BurnModelOLD;
		protected var control:BurnControl;
		
		public function PussyController( model:BurnModelOLD, control:BurnControl )
		{
			this.model = model;
			this.control = control;
		}
	}
}
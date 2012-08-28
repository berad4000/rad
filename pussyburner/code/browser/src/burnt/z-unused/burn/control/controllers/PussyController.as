package burnt.z-unused.burn.control.controllers
{
	import flash.events.EventDispatcher;
	
	import burnt.z-unused.burn.control.BurnControl;
	import burnt.z-unused.burn.model.BurnModelOLD;

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
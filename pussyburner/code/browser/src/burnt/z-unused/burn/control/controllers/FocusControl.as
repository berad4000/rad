package burnt.z-unused.burn.control.controllers
{
	import flash.events.EventDispatcher;
	
	import burnt.z-unused.burn.control.BurnControl;
	import burnt.z-unused.burn.model.BurnModelOLD;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class FocusControl extends PussyController
	{
		
		public function FocusControl( model:BurnModelOLD, control:BurnControl )
		{
			super( model, control );
		}
		
		public function udateFocus ( x:Number, y:Number ):void
		{
			this.model.focus.x = x;
			this.model.focus.y = y;
			
			trace( "focused on x: " + this.model.focus.x  + " ::: " + this.model.focus.y );
		}
		
	}
}
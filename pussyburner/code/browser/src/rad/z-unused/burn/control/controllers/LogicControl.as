package rad.rad.burn.control.controllers
{
	import flash.events.EventDispatcher;
	
	import rad.rad.burn.control.BurnControl;
	import rad.rad.burn.control.events.ModeEvent;
	import rad.rad.burn.model.BurnModelOLD;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class LogicControl extends PussyController
	{
		
		public function LogicControl( model:BurnModelOLD, control:BurnControl )
		{
			super( model, control );
		}
		
		public function modeSwitchActivate():void
		{
			//this.model.mode = Modes.ACTIVATE;
			//this.dispatchEvent( new ModeEvent( ModeEvent.ACTIVATE ) );
		}
		
		public function modeSwitchUpdate():void
		{
			//this.model.mode = Modes.UPDATE;
			//this.dispatchEvent( new ModeEvent( ModeEvent.UPDATE ) );
		}
		
		public function modeSwitchExecute():void
		{
			//this.model.mode = Modes.EXECUTE;
			//this.dispatchEvent( new ModeEvent( ModeEvent.EXECUTE ) );
		}
		
	}
}
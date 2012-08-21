package rad.rad.burn.control
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import rad.rad.burn.control.controllers.FocusControl;
	import rad.rad.burn.control.controllers.LogicControl;
	import rad.rad.burn.control.controllers.TouchControl;
	import rad.rad.burn.model.BurnModelOLD;

	public class BurnControl extends EventDispatcher
	{
		private var _model:BurnModelOLD;
		
		public var touch:TouchControl;
		public var focus:FocusControl;
		public var logic:LogicControl;
		
		public function BurnControl( model:BurnModelOLD )
		{
			_model = model;
			
			this.touch = new TouchControl( model, this );
			this.focus = new FocusControl( model, this );
			this.logic = new LogicControl( model, this );
		}
		
		public function start ():void
		{
			this.dispatchEvent( new Event( Event.OPEN ) );
		}
		
		public function stop ():void
		{
			this.dispatchEvent( new Event( Event.CLOSE ) );
		}
	}
}
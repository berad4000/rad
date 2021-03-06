package burnt.z-unused.soul.controls
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import burnt.z-unused.soul.CreationCore;
	import burnt.z-unused.soul.events.CreationEvent;

	public class ModeControl extends EventDispatcher
	{
		protected var model:CreationCore;
		
		public function ModeControl( model:CreationCore )
		{
			this.model = model;
		}
		
		public function updatePrimaryMode ( state:String ):void
		{
			if ( this.model.mode.primaryMode == state ) return;
			
			this.model.mode.primaryMode = state;
			this.dispatchEvent( new CreationEvent( CreationEvent.MODE_UPDATE , this.model.self ) );
		}
		
	}
}
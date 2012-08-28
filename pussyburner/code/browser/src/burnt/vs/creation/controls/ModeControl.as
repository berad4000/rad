package burnt.vs.creation.controls
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import vs.creation.SoulModel;
	import burnt.vs.creation.events.SoulEvent;

	public class ModeControl extends EventDispatcher
	{
		protected var model:SoulModel;
		
		public function ModeControl( model:SoulModel )
		{
			this.model = model;
		}
		
		public function updatePrimaryMode ( state:String ):void
		{
			if ( this.model.mode.primaryMode == state ) return;
			
			this.model.mode.primaryMode = state;
			this.dispatchEvent( new SoulEvent( SoulEvent.MODE_UPDATE , this.model.self ) );
		}
		
	}
}
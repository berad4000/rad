package vs.creation.control.elements
{
	import vs.creation.core.CreationCore;

	public class ModeControl
	{
		protected var core:CreationCore; 
		
		public function ModeControl( core:CreationCore )
		{
			this.core = core;
		}
		
		public function updatePrimaryMode ( state:String ):void
		{
			if ( core.mode.primaryMode == state ) return;
			
			core.mode.primaryMode = state;
			
			
			//this.dispatchEvent( new CreationEvent( CreationEvent.MODE_UPDATE , this.model.self ) ); //needs to go into the main control
		}
	}
}
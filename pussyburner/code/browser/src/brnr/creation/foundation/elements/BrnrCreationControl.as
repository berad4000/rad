package brnr.creation.foundation.elements
{
	import vs.creation.control.CreationControl;

	public class BrnrCreationControl extends CreationControl
	{
		protected var brnrCore:BrnrCreationCore; 
		
		public function BrnrCreationControl( core:BrnrCreationCore )
		{
			this.brnrCore = core;
			super( this.brnrCore );
		}
	}
}
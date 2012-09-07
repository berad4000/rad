package xo.creation.foundation.elements
{
	import vs.creation.control.CreationControl;

	public class X0CreationControl extends CreationControl
	{
		protected var brnrCore:X0CreationCore; 
		
		public function X0CreationControl( core:X0CreationCore )
		{
			this.brnrCore = core;
			super( this.brnrCore );
		}
	}
}
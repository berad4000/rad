package vs.creation.core.elements
{
	import vs.creation.core.CreationCore;

	public class ModeCore
	{
		protected var core:CreationCore;
		
		public var live:Boolean = true;
		
		public var primaryMode:String = "";
		
		public function ModeCore( core:CreationCore )
		{
			this.core = core;
		}
		
		public function destroy():void
		{
			core = null;
		}
	}
}
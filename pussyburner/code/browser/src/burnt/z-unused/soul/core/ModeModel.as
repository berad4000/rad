package burnt.z-unused.soul.core
{
	import burnt.z-unused.soul.CreationCore;
	
	public class ModeModel 
	{
		protected var model:CreationCore;
		
		public var live:Boolean = true;
		
		public var primaryMode:String = "";;
		
		public function ModeModel( model:CreationCore)
		{
			this.model = model;
		}
		
	}
}
package vs.soul.core
{
	import vs.soul.CreationCore;
	
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
package rad.vs.soul.model
{
	import rad.vs.soul.SoulModel;
	
	public class ModeModel 
	{
		protected var model:SoulModel;
		
		public var live:Boolean = true;
		
		public var primaryMode:String = "";;
		
		public function ModeModel( model:SoulModel)
		{
			this.model = model;
		}
		
	}
}
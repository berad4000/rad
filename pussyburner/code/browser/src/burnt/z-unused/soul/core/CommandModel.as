package burnt.z-unused.soul.core
{
	import flash.utils.Dictionary;
	
	import vs.Soul;
	import burnt.z-unused.soul.CreationCommand;
	import burnt.z-unused.soul.CreationCore;

	public class CommandModel
	{
		private var _model:CreationCore;
		
		public var groupList:Vector.<Vector> = new Vector.<Vector>;
		public var groups:Dictionary = new Dictionary;
		
		public var target:Soul;
		
		public function CommandModel( model:CreationCore )
		{
			_model = model;
		}
		
		public function reset ():void
		{
			groupList 	= new Vector.<Vector>;
			groups		= new Dictionary;
		}
		
	}
}
package vs.creation.core
{
	import flash.utils.Dictionary;
	
	import vs.Creation;
	import vs.creation.CreationCommand;
	import vs.creation.CreationCore;

	public class CommandModel
	{
		private var _model:CreationCore;
		
		public var groupList:Vector.<Vector> = new Vector.<Vector>;
		public var groups:Dictionary = new Dictionary;
		
		public var target:Creation;
		
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
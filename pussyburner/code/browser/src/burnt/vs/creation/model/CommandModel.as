package burnt.vs.creation.model
{
	import flash.utils.Dictionary;
	
	import vs.creation.Soul;
	import vs.creation.SoulCommand;
	import vs.creation.SoulModel;

	public class CommandModel
	{
		private var _model:SoulModel;
		
		public var groupList:Vector.<Vector> = new Vector.<Vector>;
		public var groups:Dictionary = new Dictionary;
		
		public var target:Soul;
		
		public function CommandModel( model:SoulModel )
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
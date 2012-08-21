package rad.vs.soul.model
{
	import flash.utils.Dictionary;
	
	import rad.vs.soul.Soul;
	import rad.vs.soul.SoulCommand;
	import rad.vs.soul.SoulModel;

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
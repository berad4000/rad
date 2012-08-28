package vs.creation
{
	import flash.utils.Dictionary;

	public class SoulFactory
	{
		
		public var commandLocation:String 	= "";
		public var soulLocation:String		= "";
		
		private static const _SINGLETON_ERROR_MESSAGE:String = "ERROR: Singleton and cannot be instantiated again. Use getInstance().";
		private static var _instance:SoulFactory;
		
		private var _soulAssets:Dictionary 	= new Dictionary; 
		
		private var _parser:SoulParser = new SoulParser;
		
		public function updateConfig ( config:XML ):void
		{
			_parser.updateConfig( config );
		}
		
		public function createSoul ( id:String ):Soul
		{
			var soul:Soul = new Soul
			return soul;
		}
		
		public function SoulFactory()
		{
			if (_instance != null)
			{
				throw new Error(_SINGLETON_ERROR_MESSAGE);
			}
			else
			{
				_instance = this;
			}
		} 
		
		public static function instance():SoulFactory
		{
			if (_instance == null)
			{
				new SoulFactory();
			}
			return _instance;
		}
	}
}
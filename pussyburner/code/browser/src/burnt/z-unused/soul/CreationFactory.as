package burnt.z-unused.soul
{
	import flash.utils.Dictionary;
	import burnt.z-unused.Soul;

	public class CreationFactory
	{
		
		public var commandLocation:String 	= "";
		public var soulLocation:String		= "";
		
		private static const _SINGLETON_ERROR_MESSAGE:String = "ERROR: Singleton and cannot be instantiated again. Use getInstance().";
		private static var _instance:CreationFactory;
		
		private var _soulAssets:Dictionary 	= new Dictionary; 
		
		private var _parser:CreationParser = new CreationParser;
		
		public function updateConfig ( config:XML ):void
		{
			_parser.updateConfig( config );
		}
		
		public function createSoul ( id:String ):Soul
		{
			var soul:Soul = new Soul
			return soul;
		}
		
		public function CreationFactory()
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
		
		public static function instance():CreationFactory
		{
			if (_instance == null)
			{
				new CreationFactory();
			}
			return _instance;
		}
	}
}
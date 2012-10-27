package vs.creation.core.elements
{
	import flash.utils.Dictionary;
	
	import vs.Creation;
	import vs.creation.core.CreationCore;

	public class CommandCore
	{
		
		private var _core:CreationCore; 
		
		public var groupList:Vector.<Vector> = new Vector.<Vector>;
		public var groups:Dictionary = new Dictionary; 
		public var target:Creation;
		
		public function CommandCore( source:CreationCore )
		{
			_core = source;
		}
		
		public function destroy ():void
		{
			_core = null; 
			
			groupList = null;
			groups = null; 
			target = null;
		}
		
		public function reset ():void
		{
			groupList 	= new Vector.<Vector>;
			groups		= new Dictionary;
		}
	}
}
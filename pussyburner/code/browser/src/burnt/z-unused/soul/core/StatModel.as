package burnt.z-unused.soul.core
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import burnt.z-unused.soul.CreationCore;
	import burnt.z-unused.soul.core.stat.Stat;
	
	public class StatModel 
	{
		private var _model:CreationCore
		
		public var statList:Vector.<Stat> 	= new Vector.<Stat>();
		public var stats:Dictionary 		= new Dictionary;
		
		public var updates:Array = new Array;
		
		public function StatModel( model:CreationCore )
		{
			_model = model;
		}
		
		public function reset ():void
		{
			this.statList 		= new Vector.<Stat>();
			this.stats 			= new Dictionary;
		}
		
	}
}
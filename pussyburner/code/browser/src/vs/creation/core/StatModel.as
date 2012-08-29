package vs.creation.core
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import vs.creation.CreationCore;
	import vs.creation.core.stat.Stat;
	
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
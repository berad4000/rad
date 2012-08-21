package rad.vs.soul.model
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import rad.vs.soul.SoulModel;
	import rad.vs.soul.model.stat.Stat;
	
	public class StatModel 
	{
		private var _model:SoulModel
		
		public var statList:Vector.<Stat> 	= new Vector.<Stat>();
		public var stats:Dictionary 		= new Dictionary;
		
		public var updates:Array = new Array;
		
		public function StatModel( model:SoulModel )
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
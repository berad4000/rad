package burnt.z-unused.soul.events
{
	
	import flash.events.Event;
	
	import burnt.z-unused.Soul;
	import burnt.z-unused.soul.core.stat.Stat;
	
	public class StatEvent extends Event {
		
		public static const EMPTY:String 	= "EMPTY";
		public static const FILL:String 	= "FILL";
		
		public static const ADD:String 		= "ADD";
		public static const SUBTRACT:String = "SUBTRACT";
		public static const UPDATE:String 	= "UPDATE";
		public static const NEW_MAX:String 	= "NEW_MAX";
		public static const LEVEL_UP:String = "LEVEL_UP";
		
		public var soul:Soul;
		public var stat:Stat;
		public var value:Number = 0;
		
		public function StatEvent( type:String, soul:Soul = null, stat:Stat = null, value:Number = 0 ) 
		{
			super( type );
			
			this.soul 	= soul;
			this.stat 	= stat;
			this.value 	= value;
		}
	}
}
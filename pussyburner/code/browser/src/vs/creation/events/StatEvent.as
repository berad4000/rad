package vs.creation.events
{
	
	import flash.events.Event;
	
	import vs.Creation;
	import vs.creation.core.stat.Stat;
	
	public class StatEvent extends Event {
		
		public static const EMPTY:String 	= "EMPTY";
		public static const FILL:String 	= "FILL";
		
		public static const ADD:String 		= "ADD";
		public static const SUBTRACT:String = "SUBTRACT";
		public static const UPDATE:String 	= "UPDATE";
		public static const NEW_MAX:String 	= "NEW_MAX";
		public static const LEVEL_UP:String = "LEVEL_UP";
		
		public var soul:Creation;
		public var stat:Stat;
		public var value:Number = 0;
		
		public function StatEvent( type:String, soul:Creation = null, stat:Stat = null, value:Number = 0 ) 
		{
			super( type );
			
			this.soul 	= soul;
			this.stat 	= stat;
			this.value 	= value;
		}
	}
}
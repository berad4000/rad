package vs.creation.cause
{
	
	import flash.events.Event;
	
	import vs.Creation;
	import vs.creation.core.elements.stat.Stat;
	
	public class StatEvent extends Event {
		
		public static const EMPTY:String 	= "EMPTY";
		public static const FILL:String 	= "FILL";
		
		public static const ADD:String 		= "ADD";
		public static const SUBTRACT:String = "SUBTRACT";
		public static const UPDATE:String 	= "UPDATE";
		public static const NEW_MAX:String 	= "NEW_MAX";
		public static const LEVEL_UP:String = "LEVEL_UP";
		
		public var creation:Creation;
		public var stat:Stat
		public var value:Number = 0;
		
		public function StatEvent( type:String, creation:Creation = null, stat:Stat = null, value:Number = 0 ) 
		{
			super( type );
			
			this.creation 	= creation;
			this.stat 		= stat;
			this.value 		= value;
		}
	}
}
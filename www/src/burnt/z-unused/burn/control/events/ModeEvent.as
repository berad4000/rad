package burnt.z-unused.burn.control.events
{
	import flash.events.Event;
	
	public class ModeEvent extends Event {
		
		public static const UPDATE:String		= "UPDATE";
		public static const ACTIVATE:String		= "ACTIVATE";
		public static const EXECUTE:String 		= "EXECUTE";
		
		public function ModeEvent ( type:String ) 
		{
			super( type );
			
		}
	}
}
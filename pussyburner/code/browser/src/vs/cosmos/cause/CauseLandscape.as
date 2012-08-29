package vs.cosmos.cause
{
	import flash.events.Event;
	
	public class CauseLandscape extends Event {
		
		public static const ADD_BASE:String		= "ADD_BASE";
		public static const ADD_LAYER:String	= "ADD_LAYER";
		
		public function CauseLandscape ( type:String ) 
		{
			super( type ); 
			
		}
	}
}
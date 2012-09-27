package vs.course.cause
{
	import flash.events.Event;
	
	import vs.course.content.environment.Environment;
	
	public class CauseEnvironment extends Event {
		
		public static const ADD:String		= "ADD";
		public static const REMOVE:String	= "REMOVE";
		
		public var content:Environment;
		
		public function CauseEnvironment ( type:String, content:Environment ) 
		{
			super( type ); 
			this.content = content;
		}
	}
}
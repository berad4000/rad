package vs.course.cause
{
	
	import starling.events.Event;
	
	import vs.Creation;
	
	public class CourseEvent extends Event {
		
		public static const ADD_CREATION:String			= "ADD_CREATION";
		public static const REMOVE_CREATION:String		= "REMOVE_CREATION";
		
		public var creation:Creation;
		
		public function CourseEvent ( type:String, creation:Creation = null ) 
		{
			super( type ); 
			this.creation = creation;
		}
	}
}
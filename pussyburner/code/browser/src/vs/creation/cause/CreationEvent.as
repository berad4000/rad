package vs.creation.cause
{
	
	import flash.events.Event;
	import vs.Creation;
	
	public class CreationEvent extends Event {
		
		public static const MODE_UPDATE:String 			= "MODE_UPDATE";
		public static const PAIN:String 				= "PAIN";
		public static const DEATH:String 				= "DEATH";
		public static const COLLISION:String 			= "COLLISION";
		
		public static const ACTIVATE:String 			= "ACTIVATE";
		public static const DEACTIVATE:String 			= "DEACTIVATE";
		
		public static const REVERSE_X_MOVEMENT:String 	= "REVERSE_X_MOVEMENT";
		
		public static const TOON_COMPLETE:String 		= "TOON_COMPLETE";
		
		public var creation:Creation;
		public var message:String 						= "avatar message event";
		
		
		public function CreationEvent( type:String, creation:Creation = null, message:String = null ) 
		{
			super( type );
			
			this.creation = creation;
			this.message = message;
		}
	}
}
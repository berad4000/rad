package vs.course.core
{
	import flash.utils.Dictionary;
	
	import vs.Course;
	
	public class CourseCore
	{
		public var cosmos:Course;
		
		public var height:Number = 0;
		public var width:Number  = 1280;
		
		public var bitmapData:Dictionary = new Dictionary( true );
		
		public var creationLocation:String;
		
		public var landscape:Dictionary 	= new Dictionary( true );
		
		public var textures:Dictionary 		= new Dictionary( true );
		public var scaleFactor:Number = 1;
		
		public var creations:Dictionary 	= new Dictionary( true );
		public var atlus:Dictionary 		= new Dictionary( true );
		
		public function CourseCore( )
		{
		}
	}
}
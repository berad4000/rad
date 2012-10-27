package vs.course
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import vs.Cosmos;
	import vs.Course;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.LandscapeLayer;
	
	public class CourseCore
	{
		public var self:Course;
		
		public var cosmos:Cosmos;
		
		public var height:Number = 0;
		public var width:Number  = 1280;
		
		public var focus:Point = new Point;
		
		public var scaleFactor:Number = 1;
		
		public var creationLocation:String;
		
		//may not need this
		public var environment:Dictionary	= new Dictionary( 	true );
		public var environmentList:Vector.<Environment>		= new Vector.<Environment>;
		
		public var landscape:Dictionary 	= new Dictionary( 	true );
		public var landscapeList:Vector.<LandscapeLayer> 	= new Vector.<LandscapeLayer>; 
		 
		public var creations:Dictionary 	= new Dictionary( 	true );
		public var creationList:Array 		= new Array;
		
		public function CourseCore( begin:Course = null )
		{
			this.self = begin;
		}
	}
}
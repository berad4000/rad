package vs.course.core
{
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import vs.Course;
	import vs.Creation;
	import vs.course.content.environment.Environment;
	import vs.course.content.landscape.LandscapeLayer;
	
	public class CourseCore
	{
		public var cosmos:Course;
		
		public var height:Number = 0;
		public var width:Number  = 1280;
		
		public var scaleFactor:Number = 1;
		
		public var creationLocation:String = "brnr.creation.form.";
		
		//may not need this
		public var bitmapData:Dictionary = new Dictionary( true );
		public var bitmapDataList:Vector.<BitmapData> 		= new Vector.<BitmapData>;
		
		public var environment:Dictionary	= new Dictionary( true );
		public var environmentList:Vector.<Environment>		= new Vector.<Environment>;
		
		public var landscape:Dictionary 	= new Dictionary( true );
		public var landscapeList:Vector.<LandscapeLayer> 	= new Vector.<LandscapeLayer>; 
		 
		public var creations:Dictionary 	= new Dictionary( true );
		public var creationList:Vector.<Creation> 			= new Vector.<Creation>;  
		
		public var atlus:Dictionary 		= new Dictionary( true );
		public var atlusList:Vector.<XML> 			= new Vector.<XML>;
		
		public var atlusTexture:Dictionary = new Dictionary( true );
		public var atlusTextureList:Vector.<TextureAtlas> = new Vector.<TextureAtlas>;
		
		public var texture:Dictionary		= new Dictionary( true );
		public var textureList:Vector.<Texture>			= new Vector.<Texture>;
		
		public function CourseCore( )
		{
		}
	}
}
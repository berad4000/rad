package vs.cosmos
{
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import vs.Cosmos;
	import vs.Course;

	public class CosmosCore
	{
		
		public var cosmos:Cosmos;
		public var course:Course;
		
		public var stage:Stage;
		
		public var scaleFactor:Number = 1;
		
		public var atlus:Dictionary 						= new Dictionary( 	true );
		public var atlusList:Vector.<XML> 					= new Vector.<XML>;
		
		public var bitmapData:Dictionary = new Dictionary( 		true ); 
		public var bitmapDataList:Vector.<BitmapData> 		= new Vector.<BitmapData>;
		
		public var texture:Dictionary						= new Dictionary( 	true );
		public var textureList:Vector.<Texture>				= new Vector.<Texture>; 
		
		//THIS NEEDS TO BE MOVED CLOSER TO THE TOP
		public var courseLocation:String 					= "xo.course.form.";
		public var creationLocation:String 					= "xo.creation.form.";
		
		public var atlusTexture:Dictionary = new Dictionary( 	true );
		public var atlusTextureList:Vector.<TextureAtlas> 	= new Vector.<TextureAtlas>;
		
		public function CosmosCore( i:Cosmos = null )
		{  
			this.cosmos = i;
		}
	}
}
package vs.creation.core
{
	import com.laiyonghao.Uuid;
	
	import flash.geom.Point;
	
	import starling.textures.TextureAtlas;
	
	import vs.Course;
	import vs.Creation;
	import vs.creation.core.elements.CommandCore;
	import vs.creation.core.elements.ModeCore;
	import vs.creation.core.elements.StatCore;

	public class CreationCore
	{
		public var self:Creation;
		
		public var course:Course;
		public var courseIndex:int = 0;
		
		public var id:String
		public var name:String;
		public var type:String;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		private var _focalPoint:Point; 
		
		public var body:StatCore;
		public var command:CommandCore;
		public var mode:ModeCore;
		
		public var textureLocation:String;
		public var atlasLocation:String;
		
		public var atlas:TextureAtlas;
		
		public var parent:Creation;
		
		public function CreationCore( i:Creation = null )
		{
			this.self = i;
			
			var uuid:Uuid = new Uuid; 
			this.id = uuid.toString();
			
			body 		= new StatCore( this );
			command 	= new CommandCore( this );
			mode 		= new ModeCore( this );
		}
		
		public function get focalPoint ():Point
		{
			if ( _focalPoint == null ) _focalPoint = new Point; 
			return _focalPoint
		}
	}
}
package burnt.z-unused.soul
{
	import com.laiyonghao.Uuid;
	
	import flash.geom.Point;
	
	import burnt.z-unused.soul.core.CommandModel;
	import burnt.z-unused.soul.core.ModeModel;
	import burnt.z-unused.soul.core.StatModel;
	//import vs.cosmos.VsWorld;
	import burnt.z-unused.Soul;

	public class CreationCore
	{
		//public var world:VsWorld;
		
		public var id:String
		public var name:String;
		public var self:Soul;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		private var _focalPoint:Point;
		
		public var body:StatModel;
		public var command:CommandModel;
		public var mode:ModeModel;
		
		public function CreationCore( i:Soul )
		{
			this.self = i;
			
			var uuid:Uuid = new Uuid;
			this.id = uuid.toString();
			
			this.body 		= new StatModel( this );
			this.command 	= new CommandModel( this );
			this.mode 		= new ModeModel( this );
		}
		
		public function get focalPoint ():Point
		{
			if ( _focalPoint == null ) _focalPoint = new Point; 
			
			return _focalPoint
		}
		
	}
}
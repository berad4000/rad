package vs.soul
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import vs.Soul;
	

	public class CreationCommand extends EventDispatcher
	{
		public var id:String;
		
		public var name:String = "Command";
		
		protected var _target:Soul;
		protected var _source:Soul;
		
		public var type:String;
		public var subtype:String;
		
		public var value:Number = 0;
		public var adjust:Number = 0;
		
		protected var _frames:Number = 0;
		public var countdown:Number;
		
		public var param1:Number = 0;
		public var param2:Number = 0;
		
		public var loop:Boolean = true;
		
		public var rangeHeight:Number 	= 0;
		public var rangeWidth:Number 	= 0;
		
		
		public function CreationCommand()
		{
		}
		
		public function set frames ( value:Number ):void
		{
			_frames = value;
		}
		
		public function get frames ():Number
		{
			return _frames;
		}
		
		public function init():void
		{
			if ( this.source == null ) return;
			
			//if ( this.source.alive == false ) return turn back on pweeze		
			
			countdown = frames;
		}
		
		
		public function get successRate( ):Number
		{
			var value:Number = 0;
			
			return value;
		}
		
		public function set target ( target:Soul ):void
		{
			_target = target;
		}
		
		public function set source ( source:Soul ):void
		{
			_source = source;
		}
		
		public function get target ():Soul
		{
			return _target;
		}
		
		public function get source ():Soul
		{
			return _source;
		}
		
		 public function execute():void
		{
			// a more complicate thing used in a past life
			//this.fate = (this.sourceStat.value - this.targetStat.value ) - this.difficulty + fate; 
		}
	
		public function success( inValue:int ):void 
		{
			
		}
		
		public function fail( inValue:int ):void 
		{
			
		}
		
		public function end( ):void
		{
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
	}
}
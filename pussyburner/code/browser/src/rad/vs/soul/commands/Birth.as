package rad.vs.soul.commands
{
	
	import flash.events.Event;
	
	import rad.vs.soul.Soul;
	import rad.vs.soul.SoulCommand;

	public class Birth extends SoulCommand
	{
		
		public function Birth ( source:Soul, type:String = null, x:Number = 0, y:Number = 0 )
		{
			this.source 	= source;
			this.type 		= type;
			
			this.param1 = x;
			this.param2 = y;
		}
		
		override public function set target( target:Soul ):void
		{
			_target = target;
		}
		
		override public function execute():void 
		{
			trace("giving birth");
			
			var soul:Soul = this.source.birth( this.type );
			soul.x = this.param1;
			soul.y = this.param2;
			

		}		
		
	}
}
package vs.creation.commands
{
	
	import flash.events.Event;
	
	import vs.Creation;
	import vs.creation.CreationCommand;

	public class Birth extends CreationCommand
	{
		
		public function Birth ( source:Creation, type:String = null, x:Number = 0, y:Number = 0 )
		{
			this.source 	= source;
			this.type 		= type;
			
			this.param1 = x;
			this.param2 = y;
		}
		
		override public function set target( target:Creation ):void
		{
			_target = target;
		}
		
		override public function execute():void 
		{
			trace("giving birth");
			
			var soul:Creation = this.source.birth( this.type );
			soul.x = this.param1;
			soul.y = this.param2;
			

		}		
		
	}
}
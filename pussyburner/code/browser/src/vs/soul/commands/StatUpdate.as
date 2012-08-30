package vs.soul.commands
{
	
	import flash.events.Event;
	
	import vs.soul.CreationCommand;
	import vs.Soul;

	public class StatUpdate extends CreationCommand
	{
		
		public function StatUpdate( target:Soul = null, type:String = null, value:Number = 0 )
		{
			this.target 	= target;
			this.type 		= type;
			this.value 		= value;
		}
		
		override public function set target( target:Soul ):void
		{
			_target = target;
		}
		
		override public function execute():void 
		{
			this.target.updateStat( this.type, this.value );
		}		
		
	}
}
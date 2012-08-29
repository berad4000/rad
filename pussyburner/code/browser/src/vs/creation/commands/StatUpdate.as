package vs.creation.commands
{
	
	import flash.events.Event;
	
	import vs.creation.CreationCommand;
	import vs.Creation;

	public class StatUpdate extends CreationCommand
	{
		
		public function StatUpdate( target:Creation = null, type:String = null, value:Number = 0 )
		{
			this.target 	= target;
			this.type 		= type;
			this.value 		= value;
		}
		
		override public function set target( target:Creation ):void
		{
			_target = target;
		}
		
		override public function execute():void 
		{
			this.target.updateStat( this.type, this.value );
		}		
		
	}
}
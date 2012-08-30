package vs.creation.command
{
	
	import flash.events.Event;
	
	import vs.soul.CreationCommand;
	import vs.Soul;

	public class ModeUpdate extends CreationCommand
	{
		
		public function ModeUpdate ( target:Soul = null, type:String = null )
		{
			this.target = target;
			this.type = type;
		}
		
		override public function set target( target:Soul ):void
		{
			_target = target;
		}
		
		override public function execute():void 
		{
			if ( this.target == null ) return;
			this.target.updateMode( this.type );
		}		
		
	}
}
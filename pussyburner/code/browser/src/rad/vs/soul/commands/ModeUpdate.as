package rad.vs.soul.commands
{
	
	import flash.events.Event;
	
	import rad.vs.soul.SoulCommand;
	import rad.vs.soul.Soul;

	public class ModeUpdate extends SoulCommand
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
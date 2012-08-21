package rad.vs.soul.commands
{
	
	import flash.events.Event;
	
	import rad.vs.soul.SoulCommand;
	import rad.vs.soul.Soul;

	public class FocalPointUpdateX extends SoulCommand
	{
		
		public function FocalPointUpdateX( target:Soul = null, value:Number = 0 )
		{
			this.target = target;
			this.value = value;
		}
		
		override public function execute():void 
		{
			trace("executing for the smell of it ");
			
			if ( this.target == null ) return;
			trace("you changing any thing " + this.target );
			this.target.updateFocalX( value );
		}		
		
	}
}
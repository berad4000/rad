package vs.creation.command
{
	
	import flash.events.Event;
	
	import burnt.z-unused.soul.CreationCommand;
	import burnt.z-unused.Soul;

	public class FocalPointUpdateX extends CreationCommand
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
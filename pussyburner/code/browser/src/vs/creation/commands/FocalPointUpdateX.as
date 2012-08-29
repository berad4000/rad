package vs.creation.commands
{
	
	import flash.events.Event;
	
	import vs.creation.CreationCommand;
	import vs.Creation;

	public class FocalPointUpdateX extends CreationCommand
	{
		
		public function FocalPointUpdateX( target:Creation = null, value:Number = 0 )
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
package vs.creation.commands
{
	
	import flash.events.Event;
	
	import vs.creation.CreationCommand;
	import vs.Creation;

	public class FocalPointUpdateY extends CreationCommand
	{
		
		public function FocalPointUpdateY( target:Creation = null, value:Number = 0 )
		{
			this.target = target;
			this.value = value;
		}
		
		override public function set target( target:Creation ):void
		{
			_target = target;
		}
		
		override public function execute():void 
		{
			if ( this.target == null ) return;
			this.target.updateFocalY( value );
		}		
		
	}
}
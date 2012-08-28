package burnt.vs.creation.commands
{
	
	import flash.events.Event;
	
	import vs.creation.SoulCommand;
	import vs.creation.Soul;

	public class FocalPointUpdateY extends SoulCommand
	{
		
		public function FocalPointUpdateY( target:Soul = null, value:Number = 0 )
		{
			this.target = target;
			this.value = value;
		}
		
		override public function set target( target:Soul ):void
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
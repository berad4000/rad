package vs.creation.commands
{
	
	import flash.events.Event;
	
	import vs.creation.CreationCommand;
	import vs.Creation;

	public class ModeUpdate extends CreationCommand
	{
		
		public function ModeUpdate ( target:Creation = null, type:String = null )
		{
			this.target = target;
			this.type = type;
		}
		
		override public function set target( target:Creation ):void
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
package vs.creation.control.elements
{
	import vs.Creation;
	import vs.creation.command.CreationCommand;
	import vs.creation.core.CreationCore;

	public class CommandControl
	{
		
		protected var core:CreationCore;
		
		public function CommandControl( core:CreationCore )
		{
			this.core = core;
		}
		
		public function newActiveTarget ( target:Creation ):void
		{
			core.command.target = target;
		}
		
		public function execute ( command:CreationCommand ):void
		{
			command.source = core.self; 
			command.execute();
		}
		
		public function executeGroupCommand ( id:String ):void
		{
			var commandList:Vector.<CreationCommand>  = core.command.groups[ id ];
			if ( commandList == null ) return;
			
			var max:Number = commandList.length;
			
			for ( var i:uint = 0; i < max; i++ )
			{
				var command:CreationCommand = commandList[ i ];
				command.execute();
			}
		}
		
		public function executeTargetGroupCommand ( id:String ):void
		{
			var commandList:Vector = core.command.groups[ id ];
			if ( commandList == null ) return;
			
			var max:Number = commandList.length;
			
			for ( var i:uint = 0; i < max; i++ )
			{
				var command:CreationCommand = commandList[ i ];
				command.target = core.command.target;
				command.execute();
			}
		}
		
		public function addGroupCommand ( command:CreationCommand, group:String ):void
		{
			command.source = core.self;
			
			var commandList:Vector.<CreationCommand> = new Vector.<CreationCommand>;
			
			if ( core.command.groups[ group ] != null )
			{
				commandList = core.command.groups[ command.id ];
				commandList.push( command ) 
				return
			}
			
			commandList.push( command  ); 
			
			core.command.groups[ group ] =	commandList;
			core.command.groupList.push( core.command.groups[ group ] as Vector );
		}
	}
}
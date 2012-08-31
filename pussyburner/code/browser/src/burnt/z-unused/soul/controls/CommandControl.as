package burnt.z-unused.soul.controls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import vs.Soul;
	import burnt.z-unused.soul.CreationCommand;
	import burnt.z-unused.soul.CreationControl;
	import burnt.z-unused.soul.CreationCore;

	public class CommandControl extends EventDispatcher
	{
		private var _model:CreationCore;
		private var _control:CreationControl
		
		public function CommandControl( model:CreationCore )
		{
			_model = model;
		}
		
		public function newActiveTarget ( target:Soul ):void
		{
			_model.command.target = target;
		}
		
		public function execute ( command:CreationCommand ):void
		{
			command.source = _model.self;
			command.execute();
		}
		
		public function executeGroupCommand ( id:String ):void
		{
			var commandList:Vector.<CreationCommand>  = _model.command.groups[ id ];
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
			var commandList:Vector = _model.command.groups[ id ];
			if ( commandList == null ) return;
			
			var max:Number = commandList.length;
			
			for ( var i:uint = 0; i < max; i++ )
			{
				var command:CreationCommand = commandList[ i ];
				command.target = _model.command.target;
				command.execute();
			}
		}
		
		public function addGroupCommand ( command:CreationCommand, group:String ):void
		{
			command.source = _model.self;
			
			var commandList:Vector.<CreationCommand> = new Vector.<CreationCommand>;
			
			if ( _model.command.groups[ group ] != null )
			{
				commandList = _model.command.groups[ command.id ];
				commandList.push( command ) 
				return
			}
			
			commandList.push( command  ); 
			
			_model.command.groups[ group ] =	commandList;
			_model.command.groupList.push( _model.command.groups[ group ] as Vector );
		}
	
	}
}
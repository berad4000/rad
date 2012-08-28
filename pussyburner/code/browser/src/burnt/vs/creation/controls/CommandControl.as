package burnt.vs.creation.controls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import vs.creation.Soul;
	import vs.creation.SoulCommand;
	import vs.creation.SoulControl;
	import vs.creation.SoulModel;

	public class CommandControl extends EventDispatcher
	{
		private var _model:SoulModel;
		private var _control:SoulControl
		
		public function CommandControl( model:SoulModel )
		{
			_model = model;
		}
		
		public function newActiveTarget ( target:Soul ):void
		{
			_model.command.target = target;
		}
		
		public function execute ( command:SoulCommand ):void
		{
			command.source = _model.self;
			command.execute();
		}
		
		public function executeGroupCommand ( id:String ):void
		{
			var commandList:Vector.<SoulCommand>  = _model.command.groups[ id ];
			if ( commandList == null ) return;
			
			var max:Number = commandList.length;
			
			for ( var i:uint = 0; i < max; i++ )
			{
				var command:SoulCommand = commandList[ i ];
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
				var command:SoulCommand = commandList[ i ];
				command.target = _model.command.target;
				command.execute();
			}
		}
		
		public function addGroupCommand ( command:SoulCommand, group:String ):void
		{
			command.source = _model.self;
			
			var commandList:Vector.<SoulCommand> = new Vector.<SoulCommand>;
			
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
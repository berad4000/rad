package burnt.z-unused.soul.content
{
	
	import vs.Soul;
	import burnt.z-unused.soul.CreationCommand;
	import burnt.z-unused.soul.CreationControl;
	import burnt.z-unused.soul.CreationCore;
	import burnt.z-unused.soul.CreationContent;
	import burnt.z-unused.soul.events.CreationEvent;
	
	import starling.display.ExtendedMovieClip;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;

	public class StarlingSoulView extends ExtendedMovieClip implements CreationContent
	{
		protected var model:CreationCore;
		protected var control:CreationControl;
		
		public function StarlingSoulView(){}
		
		public function awake ( model:CreationCore, control:CreationControl ):void
		{
			this.model 		= model;
			this.control 	= control; 
			
			this.x = model.x;
			this.y = model.y;
			
			this.addEventListener( EnterFrameEvent.ENTER_FRAME, change );
			
			this.control.stat.addEventListener( CreationEvent.DEATH, death );	
		}
		
		public function birth	( type:String ):Soul { return new Soul } 
		
		public function execute ( command:CreationCommand ):void { this.control.command.execute( command ) };
		
		public function statValue ( id:String ):Number { return this.control.stat.fetchStatValue( id ); }
		
		public function updateStat( id:String , value:Number ):void { control.stat.updateStat( id, value ); }
		
		public function death ( event:CreationEvent ):void { this.removeEventListener( EnterFrameEvent.ENTER_FRAME, change ); }
		
		public function change ( event:Event ):void { }
	}
}
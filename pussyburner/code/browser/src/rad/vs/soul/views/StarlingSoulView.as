package rad.vs.soul.views
{
	
	import rad.vs.soul.Soul;
	import rad.vs.soul.SoulCommand;
	import rad.vs.soul.SoulControl;
	import rad.vs.soul.SoulModel;
	import rad.vs.soul.SoulView;
	import rad.vs.soul.events.SoulEvent;
	
	import starling.display.ExtendedMovieClip;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;

	public class StarlingSoulView extends ExtendedMovieClip implements SoulView
	{
		protected var model:SoulModel;
		protected var control:SoulControl;
		
		public function StarlingSoulView(){}
		
		public function awake ( model:SoulModel, control:SoulControl ):void
		{
			this.model 		= model;
			this.control 	= control; 
			
			this.x = model.x;
			this.y = model.y;
			
			this.addEventListener( EnterFrameEvent.ENTER_FRAME, change );
			
			this.control.stat.addEventListener( SoulEvent.DEATH, death );	
		}
		
		public function birth	( type:String ):Soul { return new Soul } 
		
		public function execute ( command:SoulCommand ):void { this.control.command.execute( command ) };
		
		public function statValue ( id:String ):Number { return this.control.stat.fetchStatValue( id ); }
		
		public function updateStat( id:String , value:Number ):void { control.stat.updateStat( id, value ); }
		
		public function death ( event:SoulEvent ):void { this.removeEventListener( EnterFrameEvent.ENTER_FRAME, change ); }
		
		public function change ( event:Event ):void { }
	}
}
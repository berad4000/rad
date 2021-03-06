package vs.creation.content
{
	
	import starling.display.ExtendedMovieClip;
	
	import vs.Creation;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;
	
	public class CreationContent extends ExtendedMovieClip
	{
		protected var core:CreationCore; 
		protected var control:CreationControl;
		
		public function CreationContent()
		{
		}
		
		public function get creation():Creation { return this.core.self } 
		
		public function awake( core:CreationCore, control:CreationControl ):void
		{
			this.core 		= core;
			this.control 	= control;
			appear();
			addCauses();
		}
		
		public function addCauses():void {}
		
		public function appear():void 
		{
			this.x = this.core.x;
			this.y = this.core.y;
		}
		
		public function removeCauses():void {}
		
		//public function execute ( event:Event = null ):void	{}
		public function action ():void						{}
		public function move ():void
		{
			this.x = this.core.x;
			this.y = this.core.y;
		}
	}
}
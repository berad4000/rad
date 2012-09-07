package vs.course
{
	import starling.display.Sprite;
	
	import vs.Creation;
	
	public class CourseContent extends Sprite
	{
		protected var core:CourseCore;
		protected var control:CourseControl;
		
		public function CourseContent()
		{
		}
		
		public function awake( core:CourseCore, control:CourseControl ):void
		{
			this.core 		= core;
			this.control 	= control;
			appear();
			addCauses();
		}
		
		public function addCauses():void {}
		
		public function appear():void {}
		
		public function removeCauses():void {}
		
		public function execute (  ):void	
		{
			var max:int = this.core.creationList.length;
			
			for ( var i:int = 0; i <  max; i++ )
			{
				var creation:Creation = this.core.creationList[ i ]; 
				this.addChildAt( creation.content, i );
			}
		}
		
		public function action ():void						{}
	}
}
package brnr.course.foundation.elements
{
	import starling.display.Sprite;
	
	import vs.Creation;
	import vs.course.content.CourseContent;
	import vs.course.control.CourseControl;
	import vs.course.core.CourseCore;

	public class BrnrCourseContent extends CourseContent
	{
		public var environment:Sprite;
		public var backgroundLayer:Sprite;
		public var creationLayer:Sprite;
		public var foregroundLayer:Sprite;
		public var uiLayer:Sprite;
		
		public function BrnrCourseContent()
		{
		}
		
		override public function awake(core:CourseCore, control:CourseControl):void
		{
			super.awake( core, control );
			
			environment = new Sprite;
			this.addChildAt( environment, 0 );
			
			backgroundLayer = new Sprite;
			this.addChildAt( backgroundLayer, 1 );
			
			creationLayer = new Sprite;
			this.addChildAt( creationLayer, 2 );
		}
		
		override public function execute (  ):void	
		{
			var max:int = this.core.creationList.length;
			
			for ( var i:int = 0; i <  max; i++ )
			{
				var creation:Creation = this.core.creationList[ i ]; 
				creationLayer.addChildAt( creation.content, i );
			}
		}
		
		
		
		private function update ():void
		{
			
		}
	}
}
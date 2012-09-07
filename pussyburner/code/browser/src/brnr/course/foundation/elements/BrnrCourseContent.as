package brnr.course.foundation.elements
{
	import brnr.creation.foundation.objects.BrnrCreationType;
	
	import starling.display.Sprite;
	
	import vs.Creation;
	import vs.course.CourseContent;
	import vs.course.CourseControl;
	import vs.course.CourseCore;

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
			
			uiLayer = new Sprite;
			this.addChildAt( uiLayer, 3 );
		}
		
		override public function execute (  ):void	
		{
			var max:int = this.core.creationList.length;
			var index:int  = 0;
			
			for ( var i:int = 0; i <  max; i++ )
			{
				var creation:Creation = this.core.creationList[ i ];
				if ( creation.parent != null ) continue;
				if ( creation.type == BrnrCreationType.FOCUS ) continue;
				creationLayer.addChildAt( creation.content, index );
				index += 1
			}
		}
		
		
		
		private function update ():void
		{
			
		}
	}
}
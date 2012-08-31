package brnr.course.form
{
	import brnr.course.foundation.BrnrCourse;
	import brnr.creation.form.Horse;

	public class StartStage extends BrnrCourse
	{
		
		public function StartStage(){}
		
		override public function appear():void
		{
			super.appear();
			
			this.environment( "media/studio.png" );
			
			//this.landscape("media/icon.png", .2, 320 );
			//this.landscape("media/icon.png", .3, 330 );
			//this.landscape("media/icon.png", .1, 300 ); // still needs layers
			
			//this.control.creation("Horse");
			//this.control.create( CosmosType.ENVIRONMENT, "media/hiRezBanner.png" );
		}
	}
}
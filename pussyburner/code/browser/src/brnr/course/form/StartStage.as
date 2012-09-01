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
			
			//this.environment( "media/studio.png" );
			
			//this.landscape("media/icon.png", .2, 320 );
			//this.landscape("media/icon.png", .3, 330 );
			//this.landscape("media/icon.png", .1, 300 ); // still needs layers
			
			var max:int = 200;
			var xPos:Number = 0;
			var yPos:Number = 0;
			var w:Number = 50;
			var h:Number = 50;
			
			for ( var i:int = 0; i <= max; i++ )
			{
				this.control.creation("Horse", xPos, yPos );
				xPos += w;
				if ( xPos > 1000)
				{
					xPos = 0;
					yPos += w;
				}
			}
			
			//this.control.create( CosmosType.ENVIRONMENT, "media/hiRezBanner.png" );
		}
	}
}
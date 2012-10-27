package
{
	import com.sociodox.theminer.TheMiner;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1000", height="500", frameRate="60", backgroundColor="#FFFFFF")]
	public class Index extends Sprite
	{
		//if you had a brain what would you look like
		
		//he would only drink water
		//he would own a bike
		//he would go rock climbing on sunday mornings
		//he would never stay out past midnight
		//he would own a nice apartment
		//he would own a nice bed
		//he would check his bank account everday
		
		public function Index()
		{ 
			var goal:Goal = new Goal( this.stage );
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);  
		}
		
		private function onAddedToStage ( event:Event ):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);  
			//this.addChild(new TheMiner());  
		}
		
		
	}	
}
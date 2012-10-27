package vs.creation.core.elements
{
	import flash.utils.Dictionary;
	
	import vs.creation.core.CreationCore;
	import vs.creation.core.elements.stat.Stat;

	public class StatCore
	{
		protected var core:CreationCore; 
		
		public var statList:Vector.<Stat> 	= new Vector.<Stat>();
		public var stats:Dictionary 		= new Dictionary;
		
		public var updates:Array = new Array;
		
		public function StatCore( core:CreationCore ) 
		{
			this.core = core;
		}
		
		public function destroy ():void
		{
			statList 	= null;
			stats		= null;
		}
		
		public function reset ():void
		{
			this.statList 		= new Vector.<Stat>();
			this.stats 			= new Dictionary;
		}
	}
}
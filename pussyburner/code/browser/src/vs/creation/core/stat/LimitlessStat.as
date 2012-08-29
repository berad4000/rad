package vs.creation.core.stat
{
	import flash.events.EventDispatcher;
	
	import vs.creation.core.stat.Stat;

	public class LimitlessStat extends Stat
	{
		
		public function LimitlessStat(){}
		
		override public function set value ( value:Number ):void 
		{ 
			_value = value;
		}
		
	}
}
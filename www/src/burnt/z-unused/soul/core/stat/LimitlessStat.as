package burnt.z-unused.soul.core.stat
{
	import flash.events.EventDispatcher;
	
	import burnt.z-unused.soul.core.stat.Stat;

	public class LimitlessStat extends Stat
	{
		
		public function LimitlessStat(){}
		
		override public function set value ( value:Number ):void 
		{ 
			_value = value;
		}
		
	}
}
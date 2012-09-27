package  vs.creation.core.elements.stat
{
	import flash.events.EventDispatcher;
	

	public class LimitlessStat extends Stat
	{
		
		public function LimitlessStat(){}
		
		override public function set value ( value:Number ):void 
		{ 
			_value = value;
		}
		
	}
}
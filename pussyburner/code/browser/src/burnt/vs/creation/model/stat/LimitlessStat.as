package burnt.vs.creation.model.stat
{
	import flash.events.EventDispatcher;
	
	import burnt.vs.creation.model.stat.Stat;

	public class LimitlessStat extends Stat
	{
		
		public function LimitlessStat(){}
		
		override public function set value ( value:Number ):void 
		{ 
			_value = value;
		}
		
	}
}
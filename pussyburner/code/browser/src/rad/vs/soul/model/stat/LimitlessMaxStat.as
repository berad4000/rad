package rad.vs.soul.model.stat
{
	import flash.events.EventDispatcher;
	
	import rad.vs.soul.model.stat.Stat;

	public class LimitlessMaxStat extends Stat
	{
		
		public function LimitlessMaxStat(){}
		
		override public function set value ( value:Number ):void 
		{ 
			_value = value;
			if ( _value < _min ) _value = _min;
		}
		
	}
}
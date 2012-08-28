package burnt.vs.creation.model.stat
{
	import flash.events.EventDispatcher;
	
	import burnt.vs.creation.model.stat.Stat;

	public class LimitlessMinStat extends Stat
	{
		
		public function LimitlessMinStat(){}
		
		override public function set value ( value:Number ):void 
		{ 
			_value = value;
			if ( _value > _max ) _value = _min;
		}
		
	}
}
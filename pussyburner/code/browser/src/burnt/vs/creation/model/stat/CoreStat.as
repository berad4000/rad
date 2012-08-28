package burnt.vs.creation.model.stat
{

	public class CoreStat extends Stat
	{
		
		public function CoreStat()
		{
		}
		
		override public function reset():void
		{
			this.value = this.max;
		}
		
		
	}
}
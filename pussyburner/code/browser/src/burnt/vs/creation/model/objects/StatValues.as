package burnt.vs.creation.model.objects
{
	public class StatValues
	{
		public var id:String;
		public var type:String;
		public var value:Number 	= 0;
		public var max:Number 		= 0;
		public var min:Number		= 0;
		
		public function StatValues( id:String, type:String, value:Number, min:Number,  max:Number)
		{   
			this.id = id;
			this.type = type;
			this.value = value;
			this.max = max;
			this.min = min;
		}
	}
}
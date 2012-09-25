package vs.cosmos
{
	import vs.Cosmos;
	import vs.Course;

	public class CosmosCore
	{
		
		public var cosmos:Cosmos;
		public var course:Course;
		
		//THIS NEEDS TO BE MOVED CLOSER TO THE TOP
		public var courseLocation:String 		= "xo.course.form.";
		public var creationLocation:String 		= "xo.creation.form.";
		
		public function CosmosCore( i:Cosmos = null )
		{  
			this.cosmos = i;
		}
	}
}
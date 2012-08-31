package vs.cosmos
{
	import vs.Cosmos;
	import vs.Course;

	public class CosmosCore
	{
		
		public var cosmos:Cosmos;
		public var course:Course;
		
		
		public var courseLocation:String 		= "brnr.course.form.";
		public var creationLocation:String 		= "brnr.creation.form.";
		
		public function CosmosCore( i:Cosmos = null )
		{  
			this.cosmos = i;
		}
	}
}
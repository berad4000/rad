package vs.cosmos
{
	import flash.utils.getDefinitionByName;
	
	import vs.Course;

	public class CosmosControl
	{
		protected var core:CosmosCore;
		
		public function CosmosControl( core:CosmosCore )
		{
			this.core = core;
		}
		
		public function course ( type:String ):void
		{
			var newCourse:Course = dynamicCourse ( type );
			if ( newCourse == null ) return
			newCourse.awake();
			newCourse.creationLocation = this.core.creationLocation;
			this.core.cosmos.addCourse( newCourse );
			this.core.course = newCourse;
		}
		
		private function dynamicCourse ( type:String ):Course 
		{
			var course:Course;
			var classInstance:Class;
			
			var def:String = this.core.courseLocation + type;
			
			try { classInstance = getDefinitionByName( def ) as Class;	}
			catch (error:Error) { trace( error.toString() );			}
			
			course = new classInstance;
			return course;
		}
	}
}
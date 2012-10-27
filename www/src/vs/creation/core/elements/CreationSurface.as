package vs.creation.core.elements
{
	import flash.utils.Dictionary;
	
	import vs.Creation;
	import vs.creation.core.CreationCore;
	import vs.creation.core.elements.stat.Stat;

	public class CreationSurface
	{
		public var creation:Creation; 
		public var type:String;
		public var texture:String;
		public var atlas:String;
		
		public function CreationSurface(creation:Creation,  texture:String = null, atlas:String = null, type:String = null ) 
		{
			this.creation 	= creation;
			this.type		= type;
			this.texture	= texture;
			this.atlas		= atlas;
		}
	}
}
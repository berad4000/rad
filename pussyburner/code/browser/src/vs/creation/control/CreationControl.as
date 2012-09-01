package vs.creation.control
{
	import flash.events.EventDispatcher;
	
	import starling.textures.TextureAtlas;
	
	import vs.Course;
	import vs.creation.control.elements.CommandControl;
	import vs.creation.control.elements.ModeControl;
	import vs.creation.control.elements.StatControl;
	import vs.creation.core.CreationCore;

	public class CreationControl 
	{
		protected var core:CreationCore;
		
		public var stat:StatControl; 
		public var command:CommandControl; 
		public var mode:ModeControl; 
		
		public function CreationControl( core:CreationCore = null )
		{
			this.core = core;
			
			this.stat 		= new StatControl( this.core	);
			this.command 	= new CommandControl( this.core );
			this.mode 		= new ModeControl( this.core 	);
		}
		
		public function updateAtlus				( atlus:TextureAtlas):void	
		{
			this.core.atlas = atlus				
		}
		
		public function updateTextureLocation 	( location:String ):void 	{ this.core.textureLocation = location 	}
		public function updateAtlasLocation		( location:String ):void	
		{ 
			this.core.atlasLocation = location	
		}
		public function updateCosmos			( cosmos:Course ):void 		{ this.core.cosmos = cosmos				}
		public function updateFocalX 			( value:Number  ):void 		{ this.core.focalPoint.x = value;		}
		public function updateFocalY 			( value:Number  ):void 		{ this.core.focalPoint.y = value;		}
	}
}
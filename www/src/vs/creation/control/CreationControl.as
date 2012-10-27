package vs.creation.control
{
	import starling.textures.TextureAtlas;
	
	import vs.Course;
	import vs.Creation;
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
		
		public function destroy ():void
		{
			stat = null 
			command = null; 
			mode = null; 
		}
		
		public function addCollide 	( creation:Creation ):void
		{
			if ( this.core == null ) return;
			if ( this.core.collides == null ) return;
			if ( this.core.collides[ creation.id ] != null ) return;
			this.core.collides[ creation.id ] = creation;
			creation.collideIndex = this.core.collideList.length;
			this.core.collideList.push( this.core.collides[ creation.id ] );
			//trace("size of the list " + this.core.collideList.length );
		}
		
		public function removeCollide			( creation:Creation ):void
		{
			if ( this.core == null ) return;
			if ( this.core.collides == null ) return;
			if ( this.core.collides[ creation.id ] == null ) return;
			
			var max:Number 	= this.core.collideList.length;
			var index:int	= 0; 
			
			for ( var i:int = 0; i < max; i++ )
			{
				var collide:Creation = this.core.collideList[ i ];
				if ( collide.id == creation.id )
				{
					index = i;
					break
				}
			}
			
			this.core.collideList.splice( index, 1 );
			delete this.core.collides[ creation.id ];
		}
		
		public function updateCollideIndex  	( value:int		):void { this.core.collideIndex = value }
		public function updateCourseIndex		( value:int		):void { this.core.courseIndex = value 	}
		public function updateType				( value:String	):void { this.core.type = value    		}
		public function updateCourse 			( course:Course ):void { this.core.course = course 		}
		public function updateParent 			( par:Creation  ):void { this.core.parent = par 		}
		
		public function updatePosition 			( x:Number, y:Number ):void
		{
			this.core.x = x;
			this.core.y = y;
		}
		
		public function updateAtlus				( atlus:TextureAtlas):void	{ this.core.atlas = atlus				}
		public function updateTextureLocation 	( location:String ):void 	{ this.core.textureLocation = location 	}
		public function updateAtlasLocation		( location:String ):void	{ this.core.atlasLocation = location	}
		public function updateCosmos			( cosmos:Course ):void 		{ this.core.course = cosmos				}
		public function updateFocalX 			( value:Number  ):void 		{ this.core.focalPoint.x = value;		}
		public function updateFocalY 			( value:Number  ):void 		{ this.core.focalPoint.y = value;		}
	}
}
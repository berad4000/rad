package vs
{
	import flash.display3D.IndexBuffer3D;
	
	import starling.textures.TextureAtlas;
	
	import vs.creation.content.CreationContent;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;
	import vs.creation.core.elements.stat.StatTypes;
	import vs.creation.core.elements.stat.StatValues;

	public class Creation
	{
		protected var core:CreationCore;
		protected var control:CreationControl;
		
		public var content:CreationContent;
		
		public function Creation(){}
		
		public function get type ():String					{ return this.core.type 					}
		public function set type ( value:String	):void		{ this.control.updateType( value ) 			}
		
		public function get parent ():Creation				{ return this.core.parent 					}
		public function set parent ( par:Creation ):void	{ this.control.updateParent( par ) 			}
		
		public function get course ():Course 				{ return this.core.course 					}
		public function set course ( verse:Course ):void 	{ this.control.updateCourse( verse ) 		}
		
		public function get courseIndex ():int 				{ return this.core.courseIndex				}
		public function set courseIndex ( value:int ):void	{ this.control.updateCourseIndex( value ) 	}
		
		public function addStat 	( id:String, value:Number,  min:Number,  max:Number, type:String = null ):void			
		{ 
			var newType:String;
			
			if ( type == null )  newType =  StatTypes.CORE;
			
			control.stat.addStat( id, value,  min,  max, newType );  
		} 
		
		public function statValue 	( id:String ):Number 				{ return control.stat.fetchStatValue( id ); }
		public function statMax	  	( id:String ):Number				{ return control.stat.fetchStatMax( id ) 	}
		public function updateStat	( id:String , value:Number ):void 	{ control.stat.updateStat( id, value ); 	}
		public function emptyStat 	( id:String ):void					{ control.stat.emptyStat(  id ); 			}
		
		public function breath():void  
		{
			this.content.move();
		}
		
		public function awake ( core:CreationCore = null, control:CreationControl = null, content:CreationContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
		}
		public function setUp():void 	{}
		
		public function dispose():void
		{
			
		}
		
		public function updatePostion ( x:Number, y:Number ):void
		{
			this.control.updatePosition( x, y );
		}
		
		public function move ():void
		{
			
		}
		
		public function set toon ( value:String ):void { this.content.play( value ) };
		
		public function addToon ( id:String, fps:Number, loop:Boolean ):void   
		{
			if ( this.atlas == null ) return; 
			content.addAnimation( id, this.core.atlas.getTextures( ), fps, loop  );
		}
		
		public function get id ():String	{ return this.core.id }
		
		public function get x ():Number		{ return this.core.x }
		public function set x ( value:Number ):void { this.core.x = value }
		
		public function get y ():Number    { return this.core.y }
		public function set y ( value:Number ):void { this.core.y = value }
		
		public function set rotation ( value:Number ):void 	{  this.content.rotation = value  }
		public function get rotation ():Number 				{  return  this.content.rotation  }
		
		public function set atlas		( value:TextureAtlas ):void 	{ this.control.updateAtlus( value ) }
		public function get atlas		(  ):TextureAtlas 				{ return this.core.atlas 			}
		
		public function set textureLocation ( value:String ):void 	{ this.control.updateTextureLocation( value )  }
		public function get textureLocation ():String				{ return this.core.textureLocation }
		
		public function set atlasLocation ( value:String ):void 	{ this.control.updateAtlasLocation( value )  }
		public function get atlasLocation ():String					{ return this.core.atlasLocation }
		
		
		public function appear():void 	{ this.content.appear() }
		public function action ():void  { }
		
	}
}
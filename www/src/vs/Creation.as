package vs
{
	import com.laiyonghao.Uuid;
	
	import flash.display3D.IndexBuffer3D;
	import flash.geom.Rectangle;
	
	import starling.textures.TextureAtlas;
	
	import vs.creation.content.CreationContent;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;
	import vs.creation.core.elements.stat.StatTypes;
	import vs.creation.core.elements.stat.StatValues;
	import vs.creation.core.object.Toon;

	public class Creation
	{
		public var exist:Boolean = true; //for pooling purposes
		
		public var content:CreationContent;
		
		protected var core:CreationCore;
		protected var control:CreationControl;
		
		public var id:String;
		
		public function Creation()
		{
			var uuid:Uuid = new Uuid; 
			this.id = uuid.toString();
		}
		
		public function get timestamp ():String						{ return this.core.timestamp				}
		
		public function get type ():String							{ return this.core.type 					}
		public function set type ( value:String	):void				{ this.control.updateType( value ) 			}
		
		public function get parent ():Creation						{ return this.core.parent 					}
		public function set parent ( par:Creation ):void			{ this.control.updateParent( par ) 			}
		
		public function get course ():Course 						{ return this.core.course 					}
		public function set course ( verse:Course ):void 			{ this.control.updateCourse( verse ) 		}
		
		public function get courseIndex ():int 						{ return this.core.courseIndex				}
		public function set courseIndex ( value:int ):void			{ this.control.updateCourseIndex( value ) 	}
		
		public function get collideIndex ():int						{ return this.core.collideIndex				}
		public function set collideIndex ( value:int ) :void		{ this.control.updateCollideIndex( value )	}	
		
		public function runCollide 	():void
		{
			if ( this.core 				== null ) return;
			if ( this.core.collideList 	== null ) return;
			
			var max:int 	= this.core.collideList.length;
			var index:int	= 0;
			
			if ( max == 0 ) return;
			
			for ( index = 0; index < max; index++ )
			{
				if ( index >= this.core.collideList.length ) continue; //not real happy with this plan 
				var target:Creation = this.core.collideList[ index ];
				if ( target == null ) continue
				if ( collideCheck( target ) ) collide( target );
			}
		}
		
		public function collideCheck ( creation:Creation ):Boolean 	{ return this.content.collideCheck( creation ) }
		
		public function collide ( creation:Creation ):void
		{
			
		}
		
		public function addCollide ( creation:Creation ):void 		
		{ 
			this.control.addCollide( creation ) 		
		};
		public function removeCollide ( creation:Creation ):void 	{ this.control.removeCollide( creation ) 	};
		
		public function addStat 	( id:String, value:Number,  min:Number,  max:Number, type:String = null ):void			
		{ 
			var newType:String;
			
			if ( type == null )  newType =  StatTypes.CORE;
			control.stat.addStat( id, value,  min,  max, newType );  
		}
		
		public function destroy():void
		{
			this.core.self 		= null;
			this.core.course 	= null;
			this.core.destroy();
			this.control.destroy();
			
			exist = false;
		}
		
		public function nuke ():void
		{
			this.core 			= null;
			this.control 		= null;
			this.content 		= null;
			
			exist = false;
		}
		
		public function statValue 	( id:String ):Number 				{ return control.stat.fetchStatValue( id ); }
		public function statMax	  	( id:String ):Number				{ return control.stat.fetchStatMax( id ) 	}
		public function updateStat	( id:String , value:Number ):void 	{ control.stat.updateStat( id, value ); 	}
		public function emptyStat 	( id:String ):void					{ control.stat.emptyStat(  id ); 			}
		
		public function execute():void  
		{
			if ( this.content == null ) return;
			this.content.move();
		}
		
		public function awake ( core:CreationCore = null, control:CreationControl = null, content:CreationContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			if ( 	this.core == null )		this.core  			= new CreationCore( this );
			if (	this.control == null )	this.control 		= new CreationControl(  this.core );
			if ( 	this.content == null )
			{
				this.content 		= new CreationContent;
				this.content.awake( this.core, this.control );
			}
		}
		
		public function setUp():void 	{}
		
		public function updatePostion ( x:Number, y:Number ):void	{	this.control.updatePosition( x, y );	}
		
		public function move ():void	{	}
		
		public function set toon ( value:String ):void { this.content.play( value ) };
		
		public function addToon ( id:String, fps:Number, loop:Boolean ):void   
		{
			if ( this.atlas == null ) return; 
			content.addAnimation( id, this.core.atlas.getTextures( ), fps, loop  );
		}
		
		public function get x ():Number		{ return this.core.x }
		public function set x ( value:Number ):void { if ( this.core != null ) this.core.x = value }
		
		public function get y ():Number    { return this.core.y }
		public function set y ( value:Number ):void { this.core.y = value }
		
		public function get width ():Number	
		{
			if ( this.content == null ) return 0
			return this.content.width;
		}
		
		public function get bounds ():Rectangle	
		{
			if ( this.content == null ) return null
			return this.content.bounds;
		}
		
		
		public function set rotation ( value:Number ):void 				{  this.content.rotation = value  }
		public function get rotation ():Number 							{  return  this.content.rotation  }
		
		public function set atlas		( value:TextureAtlas ):void 	{ this.control.updateAtlus( value ) }
		public function get atlas		(  ):TextureAtlas 				{ return this.core.atlas 			}
		
		public function set textureLocation ( value:String ):void 		{ this.control.updateTextureLocation( value )  }
		public function get textureLocation ():String					{ return this.core.textureLocation }
		
		public function set atlasLocation ( value:String ):void 		{ this.control.updateAtlasLocation( value )  }
		public function get atlasLocation ():String					
		{ 
			if ( this.core == null ) return null;
			return this.core.atlasLocation 
		}
		
		
		public function appear():void 	
		{ 
			this.addToon( Toon.IDLE, 24, true ); 
			this.toon = Toon.IDLE;
			this.content.appear() 
		}
		
		public function action ():void  { }
		
	}
}
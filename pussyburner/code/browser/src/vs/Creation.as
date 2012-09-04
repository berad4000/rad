package vs
{
	import starling.textures.TextureAtlas;
	
	import vs.creation.content.CreationContent;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;

	public class Creation
	{
		protected var core:CreationCore;
		protected var control:CreationControl;
		
		public var content:CreationContent;
		
		public function Creation()
		{
			
		}
		
		public function breath():void  
		{
			this.content.move();
		}
		
		public function awake ( core:CreationCore = null, control:CreationControl = null, content:CreationContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			setUp();
		}
		
		public function updatePostion ( x:Number, y:Number ):void
		{
			this.control.updatePosition( x, y );
		}
		
		//BurnToon.IDLE, atlas.getTextures("Horse" ), 14, true
		//public function addToon ( id:String, fps:Number, loop:Boolean ):void
		//{
		//}
		
		public function move ():void
		{
			
		}
		
		public function set toon ( value:String ):void { this.content.play( value ) };
		
		public function addToon ( id:String, fps:Number, loop:Boolean ):void   
		{
			trace("what does the toon look like " + id );
			
			if ( this.atlas == null ) return; 
		
			content.addAnimation( id, this.core.atlas.getTextures( ), fps, loop  );
		}
		
		public function get id ():String	{ return this.core.id }
		
		public function get x ():Number		{ return this.core.x }
		public function set x ( value:Number ):void { this.core.x = value }
		
		public function get y ():Number    { return this.core.y }
		public function set y ( value:Number ):void { this.core.y = value }
		
		public function set atlas		( value:TextureAtlas ):void 	{ this.control.updateAtlus( value ) }
		public function get atlas		(  ):TextureAtlas 				{ return this.core.atlas 			}
		
		public function set textureLocation ( value:String ):void 	{ this.control.updateTextureLocation( value )  }
		public function get textureLocation ():String				{ return this.core.textureLocation }
		
		public function set atlasLocation ( value:String ):void 	{ this.control.updateAtlasLocation( value )  }
		public function get atlasLocation ():String					{ return this.core.atlasLocation }
		
		public function setUp():void 	{}
		public function appear():void 	{ this.content.appear() }
		
	}
}
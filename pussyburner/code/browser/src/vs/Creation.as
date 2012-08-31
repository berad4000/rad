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
		
		public function awake ( core:CreationCore = null, control:CreationControl = null, content:CreationContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			setUp();
		}
		
		//BurnToon.IDLE, atlas.getTextures("Horse" ), 14, true
		//public function addToon ( id:String, fps:Number, loop:Boolean ):void
		//{
		//}
		
		public function set toon ( value:String ):void { this.content.play( value ) };
		
		public function addToon ( id:String, fps:Number, loop:Boolean ):void   
		{
			if ( this.atlas == null ) return; 
			trace("you are indeed adding an toon ");
			trace("do we have content " + content );
			content.addAnimation( id, this.core.atlas.getTextures( "LittleAdd"  ), fps, loop  );
		}
		
		public function get id ():String	{ return this.core.id }
		
		public function set atlas		( value:TextureAtlas ):void 	{ this.control.updateAtlus( value ) }
		public function get atlas		(  ):TextureAtlas 				{ return this.core.atlas 			}
		
		public function set textureLocation ( value:String ):void 	{ this.control.updateTextureLocation( value )  }
		public function get textureLocation ():String				{ return this.core.textureLocation }
		
		public function set atlasLocation ( value:String ):void 	{ this.control.updateAtlasLocation( value )  }
		public function get atlasLocation ():String					{ return this.core.atlasLocation }
		
		public function setUp():void 	{};
		public function appear():void 	{ this.content.appear() }
	}
}
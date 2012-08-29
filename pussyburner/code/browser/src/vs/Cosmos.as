package vs
{
	import starling.textures.Texture;
	
	import vs.cosmos.cause.CauseEnvironment;
	import vs.cosmos.content.CosmosContent;
	import vs.cosmos.content.environment.Environment;
	import vs.cosmos.content.landscape.Landscape;
	import vs.cosmos.content.landscape.LandscapeLayer;
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;
	import vs.cosmos.core.data.DataLandscapeLayer;

	public class Cosmos
	{
		public var content:CosmosContent;
		
		protected var core:CosmosCore;
		protected var control:CosmosControl;
		
		protected var environment:Environment; 
		protected var landscape:Landscape; 
		
		public function Cosmos()
		{
		}
		
		public function awake ( core:CosmosCore = null, control:CosmosControl = null, content:CosmosContent = null ):void
		{
			if ( core 		!= null ) 	this.core = core;
			if ( control 	!= null ) 	this.control = control;
			if ( content 	!= null ) 	this.content = content;
			
			if ( this.core != null ) this.core.cosmos = this;
			
			appear();
		}
		
		public function appear():void {}
		
		public function addCauses():void 
		{
			//this.control.addEventListener( CauseEnvironment.ADD, addEnvironment ); 
		}
		
		public function addLandscape ( texture1:Texture,  texture2:Texture, data:DataLandscapeLayer ):void
		{
			if ( landscape == null ) 
			{
				landscape = new Landscape;
				landscape.awake( this.core, this.control );
				content.addChild( landscape );
			}
				
			landscape.addLayer( texture1, texture2, data.parallax, data.y );
		}
		
		public function addEnvironment ( display:Environment ):void
		{
			trace("adding the environment dude ");
			environment = display;
			content.addChildAt( environment, 0 );
		}
		
		
		
	}
}
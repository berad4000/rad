package vs.cosmos.content.landscape
{
	import burnt.rad.burn.world.Assets;
	
	import com.greensock.TweenMax;
	
	import flashx.textLayout.formats.BackgroundColor;
	
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	import vs.cosmos.content.CosmosContent;
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;
	
	public class Landscape extends CosmosContent
	{
		
		private var _layers:Vector.<LandscapeLayer> = new Vector.<LandscapeLayer>();
		private var _base:Image;
		
		protected var speed:Number = 20;
		
		public function Landscape()
		{ 
		}
		
		public function addBase ( asset:String ):void
		{
			var tex:Texture = Assets.getTexture( asset);
			tex.repeat = true;
			_base = new Image( tex );
			addChild( _base );
			_base.blendMode = BlendMode.NONE; 
			_base.smoothing = TextureSmoothing.NONE;  
			this.addChild(  _base);
		}
		
		public function addLayer ( texture1:Texture, texture2:Texture, parallax:Number = 1,  y:Number = 0 ):void
		{
			var layer:LandscapeLayer = new LandscapeLayer( texture1, texture2 );
			layer.parallax = parallax;
			layer.y = y;
			_layers.push( layer );
			
			addChild( layer);
		}
		
		override public function action():void
		{
			var max:Number = _layers.length
				
			for ( var i:Number = 0; i < max; i++ )
			{
				var layer:LandscapeLayer = _layers[ i ];
				if ( layer == null ) return;
				var posX:Number = layer.x
				posX -= Math.ceil( this.speed * layer.parallax);
				TweenMax.to( layer, .001, { x:posX, onUpdate:update, onUpdateParams:[ layer ]  });
			}
		}
		
		public function update( layer:LandscapeLayer ):void
		{
			if (layer.x < this.core.width * -1 ) layer.x = 0;
		}
		
	}
}
package vs.starling
{
	import com.greensock.TweenMax;
	
	import flash.events.Event;
	
	import flashx.textLayout.formats.BackgroundColor;
	
	import burnt.rad.burn.world.Assets;
	
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	public class Background extends StarlingWorld
	{
		
		private var _layers:Vector.<BackgroundLayer> = new Vector.<BackgroundLayer>();
		private var _base:Image;
		
		protected var speed:Number = 20;
		
		public function Background()
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
			//_base.width = this.model.stageWidth;
			this.addChild(  _base);
		}
		
		public function addLayer ( asset:String, parallax:Number = 1,  y:Number = 0 ):void
		{
			var layer:BackgroundLayer = new BackgroundLayer( asset );
			layer.parallax = parallax;
			this.addChild( layer);
			layer.y = y;
			_layers.push( layer );	
		}
		
		public function execute():void
		{
			var max:Number = _layers.length
				
			for ( var i:Number = 0; i < max; i++ )
			{
				var layer:BackgroundLayer = _layers[ i ];
				if ( layer == null ) return;
				
				var posX:Number = layer.x
				
				posX -= Math.ceil( this.speed * layer.parallax);
				
				TweenMax.to( layer, .001, { x:posX, onUpdate:update, onUpdateParams:[ layer ]  });
			}
		}
		
		public function update( layer:BackgroundLayer ):void
		{
			if (layer.x < -1280) layer.x = 0;
		}
		
		
		
	}
}
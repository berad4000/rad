package vs.course.content.landscape
{
	
	import com.greensock.TweenMax;
	import vs.course.content.CourseContent;
	
	
	public class Landscape extends CourseContent
	{
		
		protected var layers:Vector.<LandscapeLayer> = new Vector.<LandscapeLayer>();
		//protected var _base:Image;
		
		protected var speed:Number = 20;
		
		public function Landscape()
		{ 
		}
		
		//public function addBase ( asset:String ):void
		//{
		//	var tex:Texture = Assets.getTexture( asset);
		//	tex.repeat = true;
		//	_base = new Image( tex );
		//	addChild( _base );
		//	_base.blendMode = BlendMode.NONE; 
		//	_base.smoothing = TextureSmoothing.NONE;  
		//	this.addChild(  _base);
		//}
		
		public function addLayer ( layer:LandscapeLayer ):void
		{
			layers.push( layer );
			addChild( layer);
		}
		
		override public function action():void
		{
			var max:Number = layers.length
				
			for ( var i:Number = 0; i < max; i++ )
			{
				var layer:LandscapeLayer = layers[ i ];
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
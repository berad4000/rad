package xo.creation.form.queen.climax
{
	import xo.creation.foundation.X0Creation;
	import xo.creation.foundation.objects.X0CreationType;
	import xo.creation.foundation.objects.X0Stats;
	import xo.creation.foundation.objects.X0Toon;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.SlowMo;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	import vs.creation.core.elements.stat.StatTypes;
	import xo.creation.form.queen.quirk.Focus;
	
	public class Missle extends X0Creation
	{
		public var focus:Focus;
		
		public function Missle(){}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"demo/climax.png";
			this.atlasLocation 		=	"demo/climax.xml";
			
			this.addStat( X0Stats.LIFE,  	5, 5, 100, StatTypes.CORE );
			
			this.type = X0CreationType.FOCUS;
		}
		
		override public function appear():void
		{
			super.appear();
			if ( focus == null ) return;
			//this.x = this.focus.x + this.focus.content.width 	*	.5;
			//this.y = this.focus.y + this.focus.content.height 	*	.5;
			
			var pointA:Point = new Point( this.x,  this.y );
			var pointB:Point = new Point( focus.x + this.focus.content.width * .5, focus.y + this.focus.content.height *.5 );
			
			var time:Number =  findDistanceTime( pointA, pointB );
			
			TweenMax.to ( this, .5, {	x:pointB.x , y:pointB.y, ease:SlowMo.ease.config(0.3, 0.65), onComplete:climaxComplete } );  
		}
		
		private function climaxComplete():void
		{
			this.focus.action();
			this.course.removeCreation( this );
		}
		
		protected function findDistanceTime ( pointA:Point, pointB:Point ):Number
		{
			var distX:Number = pointA.x - pointB.x;
			var distY:Number = pointA.y - pointB.y;
			var dist:Number	= Math.sqrt( distX * distX + distY * distY );  
			
			return dist / this.statValue( X0Stats.FAST ); 
		}
		
	}
}
package brnr.creation.form
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Elastic;
	
	import flash.geom.Point;
	
	import brnr.creation.foundation.BrnrCreation;
	import brnr.creation.foundation.elements.objects.BrnrToon;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	
	public class PssyHorse extends BrnrCreation
	{
		
		protected var startTouch:Point 		= new Point;
		protected var endTouch:Point 		= new Point;
		protected var translation:Point 	= new Point;
		
		protected var speed:Number = 5;
		
		protected var queen:Bombshell;
		
		public function PssyHorse()
		{
			
		}
		
		override public function setUp():void
		{
			this.textureLocation	=  	"media/queen/horseToon.png";
			this.atlasLocation 		=	"media/queen/horseToon.xml";
		}
		
		override public function appear():void
		{
			this.addToon( BrnrToon.IDLE, 18, true );
			this.toon = BrnrToon.IDLE;
			super.appear();
			
			this.content.addEventListener( TouchEvent.TOUCH, touch );
		}
		
		override public function updatePostion ( x:Number, y:Number ):void
		{
			this.control.updatePosition( x, y );
		}
		
		private function touch ( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			
			if ( touch == null ) return; /// seems very weird Taking this out lets see if it will crash
			
			var target:CreationContent = touch.target.parent as CreationContent;
			var creation:Creation = target.creation;
			
			//var destX:Number = globalX;
			//var destY:Number = globalY;
			
			//trace( "LOCATION HURTS " + globalX  + " ::: " + localX );
		
			switch ( touch.phase )
			{
				case TouchPhase.BEGAN: 
					startTouch 			= new Point( touch.globalX, touch.globalY);
					translation			= target.globalToLocal( startTouch );
					//startTouch 			= target.globalToLocal( startTouch );
					var hold1:Number 	= startTouch.x;
					var hold2:Number 	= startTouch.y;
					
					trace("hold 1 " + hold1 + " hold2 " + hold2 );
					break;
				
				case TouchPhase.MOVED:
					
					
					endTouch.x = touch.globalX;
					endTouch.y = touch.globalY;
					
					var localX:Number = startTouch.x;
					var localY:Number = startTouch.y;
					
					var differenceX:Number = endTouch.x - translation.x;
					var differenceY:Number = endTouch.y - translation.y;
					
					var destX:Number = endTouch.x + startTouch.x;
					var destY:Number = endTouch.y + startTouch.y;
					
					var time:Number =  findDistanceTime ( startTouch, new Point( endTouch.x, endTouch.y ) );
					trace(" iam a scientist "+ time );
					
					TweenMax.to( this, time, { x:differenceX, y:differenceY, ease:Elastic.easeOut});  
					
					//trace("MOVE " + creation );
					break;
				case TouchPhase.ENDED:
					TweenMax.to( this, .4, { x:this.x, y:this.y  , ease:Bounce.easeInOut });  
					break;
			}
		}
		
		protected function findDistanceTime ( start:Point, end:Point ):Number
		{
			var destXA:Number 	= start.x;
			var destYA:Number 	= start.y;
			
			var destXB:Number 	= end.x;
			var destYB:Number	= end.y;
			
			var distX:Number = destXA - destXB;
			var distY:Number = destYA - destYB;
			var dist:Number	= Math.sqrt( distX * distX + distY * distY );  
			
			return dist / this.speed; 
		}
		
		
		
		override public function move( ):void
		{
			//disable somewhere
		}
		
	}
}
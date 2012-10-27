package xo.creation.form.queen
{
	import xo.creation.form.queen.quirk.Body;
	import xo.creation.form.queen.quirk.Lust;
	import xo.creation.form.queen.quirk.Flow;
	import xo.creation.form.queen.quirk.Focus;
	import xo.creation.form.queen.quirk.Friction;
	import xo.creation.foundation.X0Creation;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	
	public class Queen extends X0Creation
	{
		
		protected var friction:Friction;
		
		//protected var flow:Flow;
		//protected var body:Body;
		//protected var desire:Lust;
		//protected var focus:Focus;
		
		public function Queen(){}
		
		override public function setUp():void
		{
			this.friction 	= new Friction;
			
			//this.flow 		= new Flow;
			//this.body 		= new Body;
			//this.desire 	= new Desire;
			//this.focus 		= new Focus;
			
			//var climax:MagicMissle = new MagicMissle;
			//climax.focus = this.focus;
			//var sourceX:Number = this.x + this.parent.x;
			//var sourceY:Number = this.y + this.parent.y;
			//this.course.creation( CreationLibrary.CLIMAX, sourceX, sourceY, climax );
		}
		
		private function pop ( event:TimerEvent ):void
		{
			go();
		}
		
		override public function appear():void
		{
			trace("is the queen making an appearence " );
			
			this.course.addCreation( this.friction );
			//this.addToon( BrnrToon.IDLE, 24, true ); 
			//this.toon = BrnrToon.IDLE;1
			super.appear();
			//this.content.addEventListener( TouchEvent.TOUCH, touch );
		}
		
		private function go ():void
		{
			//var climax:MagicMissle = new MagicMissle;
			//climax.focus = this.focus;
			//var sourceX:Number = this.x + this.parent.x;
			//var sourceY:Number = this.y + this.parent.y;
			//this.course.creation( CreationLibrary.CLIMAX, sourceX, sourceY, climax );
		}
		
		private function touch ( event:TouchEvent ):void
		{
			//var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			
			//if ( touch == null ) return; /// seems very weird Taking this out lets see if it will crash
			
			//var target:CreationContent = touch.target.parent as CreationContent; 
			//var creation:Creation = target.creation; 
			
			//if ( creation != this ) return;
			
			//switch ( touch.phase )
			//{
			//	case TouchPhase.BEGAN: 
			//	go();
			//	break;
				
			//	case TouchPhase.MOVED:
			//	break;
			//	case TouchPhase.ENDED:
			//	break;
			//}
		}
		
	}
}
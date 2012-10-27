package xo.creation.form
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Elastic;
	
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import vs.Creation;
	import vs.course.cause.CourseEvent;
	import vs.creation.content.CreationContent;
	
	import xo.creation.form.queen.quirk.Body;
	import xo.creation.form.queen.quirk.Flow;
	import xo.creation.form.queen.quirk.Focus;
	import xo.creation.form.queen.quirk.Friction;
	import xo.creation.form.queen.quirk.Lust;
	import xo.creation.foundation.X0Creation;
	
	public class Dragger extends X0Creation
	{
		protected var startTouch:Point 		= new Point; 
		protected var endTouch:Point 		= new Point;
		protected var translation:Point 	= new Point;
		
		public var touched:Boolean = false;
		
		private var _delay:int = 0;
		private var _frame:int = 0;
		private var _frameMax:int = 3;
		
		public function Dragger(){}
		
		override public function setUp():void
		{
			this.content.addEventListener		( 	TouchEvent.TOUCH, touch 					);
			this.course.content.addEventListener( 	CourseEvent.ADD_CREATION, addCreation 		);
			this.course.content.addEventListener( 	CourseEvent.REMOVE_CREATION, removeCreation );
			
			
		}
		
		override public function destroy():void
		{
			if ( this.course != null )
			{
				this.course.content.removeEventListener( 	CourseEvent.ADD_CREATION, addCreation );
				this.course.content.removeEventListener( 	CourseEvent.REMOVE_CREATION, removeCreation );
			}
				
			super.destroy();
		}
		
		override public function collide(creation:Creation):void
		{
			collideDragger ( creation as Dragger );
		}
		
		private function collideDragger ( dragger:Dragger ):void
		{
			if ( dragger.touched ) return
			this.course.removeCreation( dragger );
		}
		
		override public function execute():void
		{
		
			if ( _frame == _delay ) this.runCollide();
			
			_frame += 1;
			if ( _frame == _frameMax ) _frame = 0;
				
			super.execute();
		}
		
		private function addCreation ( event:CourseEvent ):void
		{
			if ( event.creation.id != this.id ) this.addCollide( event.creation ); 
		}
		
		private function removeCreation ( event:CourseEvent ):void
		{
			if ( event.creation.id == this.id ) return;
			content.alpha = .1
			if ( event.creation.id != this.id ) this.removeCollide( event.creation );
		}
				
		//we can do better
		private function touch ( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			
			if ( touch == null ) return; /// seems very weird Taking this out lets see if it will crash
			
			var target:CreationContent = touch.target.parent as CreationContent;
			var creation:Creation = target.creation;
			
			if ( creation != this ) return;
			
			switch ( touch.phase )
			{
				case TouchPhase.BEGAN: 
					startTouch 			= new Point( touch.globalX, touch.globalY);
					translation			= target.globalToLocal( startTouch );
					var hold1:Number 	= startTouch.x;
					var hold2:Number 	= startTouch.y;
					this.touched = true;
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
					
					TweenMax.to( this, .1, { x:differenceX, y:differenceY, ease:Elastic.easeOut});  
					break;
				case TouchPhase.ENDED:
					TweenMax.to( this, .4, { x:this.x, y:this.y  , ease:Bounce.easeInOut });
					this.touched = false;
					break;
			}
		}
		
		override public function appear():void
		{
			super.appear();
			
			var max:int = this.course.creationList.length;
			
			for ( var i:int = 0; i < max; i++ )
			{
				var creation:Creation = this.course.creationList[ i ];
				if ( creation == null ) continue;
				if ( creation.id != this.id ) this.addCollide( creation ); 
			}
			
			this.content.alpha = .1;
			
			var value:String = this.timestamp.charAt( this.timestamp.length - 1 );
			var valueInt:int = int( value );
			
			_delay = valueInt%3;
			
		}
	}
}
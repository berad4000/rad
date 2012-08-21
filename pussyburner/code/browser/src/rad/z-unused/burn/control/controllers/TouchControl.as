package rad.rad.burn.control.controllers
{
	import flash.events.EventDispatcher;
	
	import rad.rad.burn.control.BurnControl;
	//import rad.rad.burn.model.objects.Modes;
	import rad.rad.burn.model.BurnModelOLD;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class TouchControl extends PussyController
	{
		
		//http://forum.starling-framework.org/topic/pixel-perfect-touch
		public function TouchControl( model:BurnModelOLD, control:BurnControl )
		{
			super( model, control );
		}
		
		public function environmentTouch( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			if( touch == null ) return;
			
			switch ( touch.phase )
			{
				case TouchPhase.BEGAN:
					environmentTouchStart( touch.globalX, touch.globalY );	
				break;
				
				case TouchPhase.MOVED:
					environmentTouchMoved( touch.globalX, touch.globalY );
				break;
				
				case TouchPhase.ENDED:
					environmentTouchEnd(  touch.globalX, touch.globalY   );
				break;
			}
		}
		
		private function environmentTouchStart ( x:Number = 0, y:Number = 0 ):void
		{
			//this.control.focus.udateFocus( x, y );
			
			//if ( this.model.mode == Modes.ACTIVATE )
			//{
			//	this.control.logic.modeSwitchUpdate();
			//	return;
			//}
				
			
			//if ( this.model.mode == Modes.UPDATE )
			//{
			//	this.control.logic.modeSwitchActivate();
			//	return;
			//}
		}
		
		private function environmentTouchEnd ( x:Number = 0, y:Number = 0 ):void
		{
			this.control.focus.udateFocus( x, y );
		}
		
		private function environmentTouchMoved ( x:Number = 0, y:Number = 0 ):void
		{
			this.control.focus.udateFocus( x, y );
		}
		
	}
}
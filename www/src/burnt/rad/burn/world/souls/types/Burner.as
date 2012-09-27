package burnt.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import burnt.z-unused.Soul;
	import burnt.z-unused.soul.CreationControl;
	import burnt.z-unused.soul.CreationCore;
	import burnt.z-unused.soul.events.CreationEvent;
	import burnt.z-unused.soul.content.StarlingSoulView;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	public class Burner extends StarlingSoulView
	{
		
		protected var clearAmount:Number = 0;
		protected var clearMax:Number = 5;
		
		
		public function Burner()
		{
		}
		
		override public function awake ( model:CreationCore, control:CreationControl ):void
		{
			super.awake( model, control );  
			this.model.self.addEventListener( CreationEvent.PAIN, showPain );
		}
		
		protected function showPain ( event:CreationEvent ):void
		{
			if ( Number( event.message ) > -2 ) return;
			
			//trace("show pain" );
			this.Color = 0xFF0000;
			this.addEventListener( Event.ENTER_FRAME, clearColor );
		}
		
		private function clearColor ( event:Event ):void
		{
			this.clearAmount += 1;
			if ( this.clearAmount < this.clearMax ) return;
			
			this.clearAmount = 0;
			
			this.Color = 0xFFFFFF;
			this.removeEventListener( Event.ENTER_FRAME, clearColor );
		}
		
		
		
		
		override public function change ( event:Event ):void
		{
			TweenMax.to( this, 1, { x:this.model.x, y:this.model.y }); 
		}
	}
}
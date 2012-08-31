package burnt.rad.burn.world.souls.types
{
	import burnt.rad.burn.world.Assets;
	import burnt.z-unused.soul.CreationControl;
	import burnt.z-unused.soul.CreationCore;
	
	import starling.core.Starling;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.TextureAtlas;

	public class Bombshell extends Burner
	{
		public function Bombshell()
		{
		}
		
		override public function awake (model:CreationCore, control:CreationControl ):void
		{
			super.awake( model, control );
			
			var atlas:TextureAtlas = Assets.fetchToon("Bombshell"); 
			if ( atlas == null ) return;
			
			this.addAnimation("idle", atlas.getTextures("ToonBombShellIdle" ), 30, true  );
			this.addAnimation("action", atlas.getTextures("ToonBombShellFinger" ), 50, true  );
			this.play("idle");
			
			//this.addEventListener( TouchEvent.TOUCH, triggered );
		}
		
		//private function triggered ( event:TouchEvent ):void
		//{
		//	var touch:Touch = event.getTouch( event.currentTarget as DisplayObject );
		//	if ( touch == null ) return; /// seems very weird
			
		///	switch ( touch.phase )
		//	{
		//		case TouchPhase.BEGAN:  
		//			movieClip1.play("idle");
		//			break;
		//		case TouchPhase.MOVED: 
		//			movieClip1.play("action");
		//			break;
		//		case TouchPhase.ENDED: 
		//			movieClip1.play("idle");
		//			break;
		//	}
			
		//}
	}
}
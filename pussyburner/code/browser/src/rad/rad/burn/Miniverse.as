package  rad.rad.burn
{
  	import flash.events.Event;
  	
  	import rad.rad.burn.world.Assets;
  	import rad.vs.world.star.StarWorld;
  	
  	import starling.core.Starling;
  	import starling.display.Sprite;
  	import starling.events.EnterFrameEvent;
  	import starling.events.Event;
  	
    public class Miniverse extends Sprite
    {
     	
		public var world:BurnWorldZ;
		
		public function Miniverse()
        {
           Assets.contentScaleFactor = Starling.current.contentScaleFactor;
           
            // load general assets
           // Assets.prepareSounds(); 		//Not working at the moment
           // Assets.loadBitmapFonts(); 	//Not working at the moment
			
		   this.world = new BurnWorldZ;
		   addEventListener( starling.events.Event.ADDED_TO_STAGE, init );
		   
		}
		
		private function init(event:starling.events.Event):void 
		{
			removeEventListener( starling.events.Event.ADDED_TO_STAGE, init);
			
			world.awake();// must be called first
			this.world.vs.updateSize( Starling.current.viewPort.width, Starling.current.viewPort.height ); 
			if ( world.view is StarWorld ) this.addChild( world.view as StarWorld );
		}
			
	}
}
package 
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    
    import starling.core.Starling;
    
    [SWF(width="320", height="480", frameRate="60", backgroundColor="#222222")]
    public class Startup extends Sprite
    {
        private var mStarling:Starling;
        
        public function Startup()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            
            mStarling = new Starling(DynAtlasSample, stage);
            mStarling.enableErrorChecking = false;
            mStarling.start();
        }
    }
}
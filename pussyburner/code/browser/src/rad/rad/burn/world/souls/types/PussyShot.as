package rad.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import rad.rad.burn.world.Assets;
	import rad.rad.burn.world.objects.BurnMode;
	import rad.rad.burn.world.objects.BurnSoul;
	import rad.rad.burn.world.objects.BurnStat;
	import rad.rad.burn.world.objects.BurnToon;
	import rad.vs.soul.Soul;
	import rad.vs.soul.SoulControl;
	import rad.vs.soul.SoulFactory;
	import rad.vs.soul.SoulModel;
	import rad.vs.soul.commands.Birth;
	import rad.vs.soul.commands.FocalPointUpdateX;
	import rad.vs.soul.commands.FocalPointUpdateY;
	import rad.vs.soul.commands.StatUpdate;
	import rad.vs.soul.events.SoulEvent;
	import rad.vs.soul.events.StatEvent;
	import rad.vs.soul.model.objects.StatTypes;
	import rad.vs.soul.model.objects.StatValues;
	import rad.vs.soul.views.StarlingSoulView;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.TextureAtlas;

	public class PussyShot extends Burner
	{
		
		public function PussyShot()
		{
		}
		
		override public function awake (model:SoulModel, control:SoulControl ):void
		{
			super.awake( model, control );
			
			//TOONS
			var atlas:TextureAtlas = Assets.fetchToon("PINKBALL"); 
			if ( atlas == null ) return;
			
			this.addAnimation( BurnToon.IDLE, atlas.getTextures("pinkBall" ), 7, true  );
			this.addAnimation( BurnToon.EXECUTE, atlas.getTextures("Plosion" ),  12, false );
			
			this.stop();
			this.play(  BurnToon.IDLE  );
		}
		
		override public function set rotation(value:Number):void
		{
			super.rotation =  value * Math.PI / 180;
		}
		
		override public function change(event:Event):void
		{
			
		}
		
	}
}
package burnt.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import burnt.rad.burn.world.Assets;
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnSoul;
	import burnt.rad.burn.world.objects.BurnStat;
	import burnt.rad.burn.world.objects.BrnrToon;
	import burnt.z-unused.Soul;
	import burnt.z-unused.soul.CreationControl;
	import burnt.z-unused.soul.CreationFactory;
	import burnt.z-unused.soul.CreationCore;
	import burnt.z-unused.soul.commands.Birth;
	import vs.creation.command.FocalPointUpdateX;
	import vs.creation.command.FocalPointUpdateY;
	import vs.creation.command.StatUpdate;
	import burnt.z-unused.soul.events.CreationEvent;
	import burnt.z-unused.soul.events.StatEvent;
	import burnt.z-unused.soul.core.objects.StatTypes;
	import burnt.z-unused.soul.core.objects.StatValues;
	import burnt.z-unused.soul.content.StarlingSoulView;
	
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
		
		override public function awake (model:CreationCore, control:CreationControl ):void
		{
			super.awake( model, control );
			
			//TOONS
			var atlas:TextureAtlas = Assets.fetchToon("PINKBALL"); 
			if ( atlas == null ) return;
			
			this.addAnimation( BrnrToon.IDLE, atlas.getTextures("pinkBall" ), 7, true  );
			this.addAnimation( BrnrToon.EXECUTE, atlas.getTextures("Plosion" ),  12, false );
			
			this.stop();
			this.play(  BrnrToon.IDLE  );
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
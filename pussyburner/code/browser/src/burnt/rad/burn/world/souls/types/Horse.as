package burnt.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnSoul;
	import burnt.rad.burn.world.objects.BurnStat;
	import burnt.rad.burn.world.objects.BurnToon;
	import burnt.rad.burn.world.Assets;
	import vs.Creation;
	import vs.creation.CreationControl;
	import vs.creation.CreationFactory;
	import vs.creation.CreationCore;
	import vs.creation.commands.Birth;
	import vs.creation.commands.FocalPointUpdateX;
	import vs.creation.commands.FocalPointUpdateY;
	import vs.creation.commands.StatUpdate;
	import vs.creation.events.CreationEvent;
	import vs.creation.events.StatEvent;
	import vs.creation.core.objects.StatTypes;
	import vs.creation.core.objects.StatValues;
	import vs.creation.content.StarlingSoulView;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.TextureAtlas;

	public class Horse extends Burner
	{
		
		public function Horse()
		{
			
		}
		
		override public function awake (model:CreationCore, control:CreationControl ):void
		{
			super.awake( model, control );
			
			//TOONS
			var atlas:TextureAtlas = Assets.fetchToon("Horse"); 
			if ( atlas == null ) return;
			
			this.addAnimation( BurnToon.IDLE, atlas.getTextures("Horse" ), 14, true  );
			this.stop();
			this.play(  BurnToon.IDLE  );
			//this.currentFrame = 6;
			
			
		}
		
	}
}
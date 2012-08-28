package burnt.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnSoul;
	import burnt.rad.burn.world.objects.BurnStat;
	import burnt.rad.burn.world.objects.BurnToon;
	import burnt.rad.burn.world.Assets;
	import vs.creation.Soul;
	import vs.creation.SoulControl;
	import vs.creation.SoulFactory;
	import vs.creation.SoulModel;
	import burnt.vs.creation.commands.Birth;
	import burnt.vs.creation.commands.FocalPointUpdateX;
	import burnt.vs.creation.commands.FocalPointUpdateY;
	import burnt.vs.creation.commands.StatUpdate;
	import burnt.vs.creation.events.SoulEvent;
	import burnt.vs.creation.events.StatEvent;
	import burnt.vs.creation.model.objects.StatTypes;
	import burnt.vs.creation.model.objects.StatValues;
	import burnt.vs.creation.views.StarlingSoulView;
	
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
		
		override public function awake (model:SoulModel, control:SoulControl ):void
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
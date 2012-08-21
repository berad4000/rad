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

	public class Cop extends Burner
	{
		
		protected var core:StatValues;
		
		
		public function Cop()
		{
			
		}
		
		override protected function showPain ( event:SoulEvent ):void
		{
			var value:Number = this.model.self.statValue( 	BurnStat.CORE );
			var max:Number	=  this.model.self.statMax( 	BurnStat.CORE );
			var percent:Number = value/max;
			
			super.showPain( event );
			
			if ( percent <= .01 ) 
			{
				this.play(  BurnToon.DEATH  );
				return;
			}
			
			if ( percent < .25 ) 
			{
				this.play(  "dam3"  );
				return;
			}
			
			if ( percent < .5 ) 
			{
				this.play(  "dam2"  );
				return;
			}
			
			if ( percent < .75 ) 
			{
				this.play(  "dam1"  );
				return;
			}
			
		}
		
		override public function awake (model:SoulModel, control:SoulControl ):void
		{
			super.awake( model, control );
			
			
			core 		= new StatValues( BurnStat.CORE, 		StatTypes.CORE, 100, 0, 100 );
			this.control.stat.batchStatValues( [ core ] );
			
			//TOONS
			var atlas:TextureAtlas = Assets.fetchToon("Cop"); 
			if ( atlas == null ) return;
			
			this.addAnimation( BurnToon.IDLE, 	atlas.getTextures("CopCarBase idle" ), 14, true  );
			this.addAnimation( BurnToon.DEATH, 	atlas.getTextures("CopCarBase death" ), 14, true  );
			this.addAnimation( "dam1", 			atlas.getTextures("CopCarBase dam1" ), 14, true  );
			this.addAnimation( "dam2", 			atlas.getTextures("CopCarBase dam2" ), 14, true  );
			this.addAnimation( "dam3", 			atlas.getTextures("CopCarBase dam3" ), 14, true  );
			
			
			this.stop();
			this.play(  BurnToon.IDLE  );
			//this.currentFrame = 6;
			
			
		}
		
		
		
		
		override public function death ( event:SoulEvent ):void
		{
			super.death( event );
			
			//this.visible = false;
			//this.play( BurnToon.DEATH );
		}
		
		override public function change(event:Event):void
		{
			
		}
		
	}
}
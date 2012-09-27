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

	public class Cop extends Burner
	{
		
		protected var core:StatValues;
		
		
		public function Cop()
		{
			
		}
		
		override protected function showPain ( event:CreationEvent ):void
		{
			var value:Number = this.model.self.statValue( 	BurnStat.CORE );
			var max:Number	=  this.model.self.statMax( 	BurnStat.CORE );
			var percent:Number = value/max;
			
			super.showPain( event );
			
			if ( percent <= .01 ) 
			{
				this.play(  BrnrToon.DEATH  );
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
		
		override public function awake (model:CreationCore, control:CreationControl ):void
		{
			super.awake( model, control );
			
			core 		= new StatValues( BurnStat.CORE, 		StatTypes.CORE, 100, 0, 100 );
			this.control.stat.batchStatValues( [ core ] );
			
			//TOONS
			var atlas:TextureAtlas = Assets.fetchToon("Cop"); 
			if ( atlas == null ) return;
			
			this.addAnimation( BrnrToon.IDLE, 	atlas.getTextures("CopCarBase idle" ), 14, true  );
			this.addAnimation( BrnrToon.DEATH, 	atlas.getTextures("CopCarBase death" ), 14, true  );
			this.addAnimation( "dam1", 			atlas.getTextures("CopCarBase dam1" ), 14, true  );
			this.addAnimation( "dam2", 			atlas.getTextures("CopCarBase dam2" ), 14, true  );
			this.addAnimation( "dam3", 			atlas.getTextures("CopCarBase dam3" ), 14, true  );
			
			this.stop();
			this.play(  BrnrToon.IDLE  );
			//this.currentFrame = 6;
		}
		
		
		
		
		override public function death ( event:CreationEvent ):void
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
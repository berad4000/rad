package burnt.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import burnt.rad.burn.world.Assets;
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnSoul;
	import burnt.rad.burn.world.objects.BurnStat;
	import burnt.rad.burn.world.objects.BurnToon;
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
		
		override public function awake (model:CreationCore, control:CreationControl ):void
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
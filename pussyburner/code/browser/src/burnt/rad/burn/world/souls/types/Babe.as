package burnt.rad.burn.world.souls.types
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import burnt.rad.burn.world.Assets;
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnSoul;
	import burnt.rad.burn.world.objects.BurnStat;
	import burnt.rad.burn.world.objects.BrnrToon;
	import vs.Soul;
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

	public class Babe extends Burner
	{
		protected var enableSelfTouch:Boolean = false;
		
		//stats
		protected var core:StatValues;
		protected var excite:StatValues;
		protected var friction:StatValues;
		protected var climax:StatValues;
		
		//commands
		protected var birthing:Birth;
		
		protected var removeCore:StatUpdate;
		
		protected var addExcite:StatUpdate;
		
		protected var addFriction:StatUpdate;
		protected var removeFriction:StatUpdate;
		
		protected var updateFocalX:FocalPointUpdateX;
		protected var updateFocalY:FocalPointUpdateY;
		
		protected var removeClimax:StatUpdate;
		
		
		public function Babe()
		{
			
		}
		
		override public function awake (model:CreationCore, control:CreationControl ):void
		{
			super.awake( model, control );
			
			//STATS
			core 		= new StatValues( BurnStat.CORE, 		StatTypes.CORE, 5000, 0, 5000 ); 
			excite 		= new StatValues( BurnStat.EXCITE, 		StatTypes.LIMITLESS_MAX, 0,0, 0 );
			friction 	= new StatValues( BurnStat.FRICTION, 	StatTypes.FILL, 0, 0, 100 );
			climax 		= new StatValues( BurnStat.CLIMAX, 		StatTypes.EMPTY, 100, 0, 100 );
			
			this.control.stat.batchStatValues( [ core, excite, friction, climax ] );
			
			//TOONS
			var atlas:TextureAtlas = Assets.fetchToon("BOMBSHELL"); 
			if ( atlas == null ) return;
			
			this.addAnimation( BrnrToon.IDLE, atlas.getTextures("BabeIdle" ), 			24, true  );
			this.addAnimation( BrnrToon.ACTION, atlas.getTextures("BabeFinger" ), 		30, true  );
			this.addAnimation( BrnrToon.EXECUTE, atlas.getTextures("BabeGasm" ), 		12, false );
			
			
			
			this.setCurrentAnimation( BrnrToon.IDLE );
			this.play();
			
			
			
			//COMMANDS
			birthing		= new Birth		( model.self, BurnSoul.CHAT				);
			
			
			removeCore 		= new StatUpdate( model.self, BurnStat.CORE, 		-1);
			addExcite		= new StatUpdate( model.self, BurnStat.EXCITE,		1	)
			addFriction 	= new StatUpdate( model.self, BurnStat.FRICTION, 	60   );
			removeFriction 	= new StatUpdate( model.self, BurnStat.FRICTION, 	0 );
			removeClimax	= new StatUpdate( model.self, BurnStat.CLIMAX, 		-5  );
			
			
			//COMMAND GOUPS
			
			
			//EVENTS
			this.addEventListener( TouchEvent.TOUCH, triggered );
			this.control.stat.addEventListener( StatEvent.FILL, fill  	);
			this.control.mode.addEventListener( CreationEvent.MODE_UPDATE, modeUpdate );
			
			//MODES
			this.control.mode.updatePrimaryMode( BurnMode.UPDATE );
			
			//SPECIAL
			this.useHandCursor = true;
		}
		
		override public function birth ( id:String ):Soul
		{
			trace("you birthing");
			
			this.model.self.activate();
			
			var soul:Soul = CreationFactory.instance().createSoul( id );
			//soul.awake();
		
			//var view:StarlingSoulView; 
			
			//switch ( id.toUpperCase() )
			//{
			//	case BurnSoul.CHAT:
			//		view = new Babe;
			//		break;
			//}
			
			//if ( view == null ) return null
				
			//soul.appear( view );
			//Starling.juggler.add( view );
			
			//if ( this.model.world.view != null ) this.model.world.addSoul( soul );
			return soul;
		}
		
		private function modeUpdate ( event:CreationEvent ):void
		{
			switch ( this.model.mode.primaryMode )
			{
				case BurnMode.UPDATE:
				this.setCurrentAnimation( BrnrToon.IDLE );
				this.play();
				this.control.stat.emptyStat( BurnStat.FRICTION );
				this.control.stat.emptyStat( BurnStat.EXCITE   );
				break;
				
				case BurnMode.ACTIVATE:
				this.setCurrentAnimation( BrnrToon.ACTION );
				this.play();
				this.updateStat( BurnStat.FRICTION, 0 );
				break;
				
				case BurnMode.EXECUTE:
				trace("create the gasm");
				this.setCurrentAnimation( BrnrToon.EXECUTE );
				this.play();
					
				birthing.param1 = this.model.focalPoint.x;
				birthing.param2 = this.model.focalPoint.y;
				
				this.control.command.execute(birthing);
				break;
			}
		}
		
		private function empty( event:StatEvent ):void
		{
			this.control.stat.removeEventListener( StatEvent.EMPTY, empty 	);
			this.control.stat.addEventListener( StatEvent.FILL, fill );
			
			this.control.stat.emptyStat( BurnStat.EXCITE   );
			this.control.stat.emptyStat( BurnStat.FRICTION );
			
			this.control.mode.updatePrimaryMode( BurnMode.UPDATE );
		}
		
		private function fill( event:StatEvent ):void
		{
			if ( event.stat.id != BurnStat.FRICTION ) return;
			this.control.stat.fillStat( BurnStat.CLIMAX );
			this.control.stat.emptyStat( BurnStat.FRICTION );
			
			this.control.stat.removeEventListener( StatEvent.FILL, fill );
			this.control.stat.addEventListener( StatEvent.EMPTY, empty 	);
			
			trace("you have reached a climax");
			this.control.mode.updatePrimaryMode( BurnMode.EXECUTE );
			
		}
		
		override public function change(event:Event):void
		{
			super.change( event );
			
			this.control.command.execute( removeCore );
			
			if ( this.model.mode.primaryMode == BurnMode.ACTIVATE ) this.execute( this.removeFriction 	);
			if ( this.model.mode.primaryMode == BurnMode.UPDATE   ) this.execute( this.addExcite 		);
			if ( this.model.mode.primaryMode == BurnMode.EXECUTE  ) this.execute( this.removeClimax 	);
			
			
			//if ( this.model.state.primaryState == SoulStates.UPDATE   )
				
			//this.control.command.executeCommand( "Execute" );
			
			//trace( "excite " +  this.control.body.fetchStatValue(  "excite"  ) );
		}
		
		override public function death ( event:CreationEvent ):void
		{
			super.death( event );
			this.play( BrnrToon.DEATH );
		}
		
		private function triggered ( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			if ( touch == null ) return; /// seems very weird
			
			switch ( touch.phase )
			{
				case TouchPhase.BEGAN:  
					this.enableSelfTouch = true;
					this.control.mode.updatePrimaryMode( BurnMode.ACTIVATE );
					this.control.stat.emptyStat(  BurnStat.FRICTION );
				
					break;
				case TouchPhase.MOVED:
					this.execute( this.addFriction );
					break;
				case TouchPhase.ENDED: 
					this.enableSelfTouch = false;
					this.control.mode.updatePrimaryMode( BurnMode.UPDATE );
					this.control.stat.removeEventListener( StatEvent.EMPTY, empty 	);
					break;
			}
		}
	}
}
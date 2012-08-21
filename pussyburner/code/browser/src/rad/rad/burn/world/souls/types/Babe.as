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
		
		override public function awake (model:SoulModel, control:SoulControl ):void
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
			
			this.addAnimation( BurnToon.IDLE, atlas.getTextures("BabeIdle" ), 			24, true  );
			this.addAnimation( BurnToon.ACTION, atlas.getTextures("BabeFinger" ), 		30, true  );
			this.addAnimation( BurnToon.EXECUTE, atlas.getTextures("BabeGasm" ), 		12, false );
			
			
			
			this.setCurrentAnimation( BurnToon.IDLE );
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
			this.control.mode.addEventListener( SoulEvent.MODE_UPDATE, modeUpdate );
			
			//MODES
			this.control.mode.updatePrimaryMode( BurnMode.UPDATE );
			
			//SPECIAL
			this.useHandCursor = true;
		}
		
		override public function birth ( id:String ):Soul
		{
			trace("you birthing");
			
			this.model.self.activate();
			
			var soul:Soul = SoulFactory.instance().createSoul( id );
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
		
		private function modeUpdate ( event:SoulEvent ):void
		{
			switch ( this.model.mode.primaryMode )
			{
				case BurnMode.UPDATE:
				this.setCurrentAnimation( BurnToon.IDLE );
				this.play();
				this.control.stat.emptyStat( BurnStat.FRICTION );
				this.control.stat.emptyStat( BurnStat.EXCITE   );
				break;
				
				case BurnMode.ACTIVATE:
				this.setCurrentAnimation( BurnToon.ACTION );
				this.play();
				this.updateStat( BurnStat.FRICTION, 0 );
				break;
				
				case BurnMode.EXECUTE:
				trace("create the gasm");
				this.setCurrentAnimation( BurnToon.EXECUTE );
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
		
		override public function death ( event:SoulEvent ):void
		{
			super.death( event );
			this.play( BurnToon.DEATH );
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
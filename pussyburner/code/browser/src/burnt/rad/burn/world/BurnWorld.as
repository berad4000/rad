package burnt.rad.burn.world
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Quad;
	import com.greensock.easing.Sine;
	import com.greensock.easing.SlowMo;
	import com.greensock.plugins.BezierPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import burnt.rad.burn.ui.TitleScreen;
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnStat;
	import burnt.rad.burn.world.objects.BrnrToon;
	import burnt.rad.burn.world.souls.types.Babe;
	import burnt.rad.burn.world.souls.types.Cop;
	import burnt.rad.burn.world.souls.types.Focus;
	import burnt.rad.burn.world.souls.types.Horse;
	import burnt.rad.burn.world.souls.types.PussyShot;
	import vs.Soul;
	import vs.creation.command.FocalPointUpdateX;
	import vs.creation.command.FocalPointUpdateY;
	import vs.creation.command.ModeUpdate;
	import vs.soul.events.CreationEvent;
	import vs.soul.content.StarlingSoulView;
	import vs.cosmos.control.CosmosControl;
	import vs.cosmos.core.CosmosCore;
	import vs.cosmos.content.landscape.Landscape;
	import vs.cosmos.content.landscape.LandscapeLayer;
	import vs.starling.StarlingWorld;
	
	import starling.display.DisplayObject;
	import starling.display.ExtendedMovieClip;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class BurnWorld extends StarlingWorld
	{
		
		protected var focalX:FocalPointUpdateX;
		protected var focalY:FocalPointUpdateY;
		protected var updateMode:ModeUpdate; 
		
		protected var model:BurnModel;
		protected var control:BurnControl;
		
		protected var background:Landscape;
		
		protected var title:TitleScreen;
		
		//protected var shot:Soul;
		protected var horse:Soul;
		public var babe:Soul;
		
		protected var focus:Soul;
		
		protected var babeStart:Point = new Point( -310, 280);
		protected var horseStart:Point = new Point( -400, 300 );
		
		protected var shots:Vector.<Soul> = new Vector.<Soul>;
		protected var currentShot:Number = 0;
		protected var shotMax:Number = 8
		
		protected var cop:Soul;
		protected var cops:Vector.<Soul> = new Vector.<Soul>;
		protected var activeCops:Array = new Array;
		protected var copAmount:Number = 5;
		protected var copRemain:Number = 0;
		
		protected var copPositions:Array = new Array;
		protected var copPos1:Point = new Point( 50, 105 );
		protected var copPos2:Point = new Point( 250, 205 );
		protected var copPos3:Point = new Point( 450, 305 );
		protected var copPos4:Point = new Point( 250, 405 );
		protected var copPos5:Point = new Point( 50, 505 );
		
		protected var attackCount:Number = 0;
		protected var attackMax:Number = 33;
		
		protected var level:Number = 0;
		
		public function BurnWorld( model:BurnModel, control:BurnControl )
		{
			this.model = model;
			this.control = control;
		}
		
		override public function awake ( model:CosmosCore, control:CosmosControl ):void
		{
			super.awake( model, control );
			
			var image:Image = new Image( Assets.getTexture( "BlueSky" ) ); 
			this.addChild( image );
			
			background = new Landscape;
			this.addChild( background );
			
			background.addLayer("Cloud1", 			.001, 50 );
			background.addLayer("Cloud2", 			.002, 30 );
			background.addLayer("Cloud3", 			.003, 0 );
			background.addLayer("Cloud4", 			.004, 40 );
			background.addLayer("Cloud5", 			.005, 20 );
			
			background.addLayer("Grass", 			.5, 150 );
			background.addLayer("Highway", 			.6, 615 );
			background.addLayer("Foregound", 		.7, 680 );
			background.addLayer("Rail", 			.9, 686 );
			
			this.addEventListener( Event.ENTER_FRAME, execute );
			
			showTitle();
			
			TweenPlugin.activate([ BezierPlugin ]); 
			
			focus = new Soul( new Focus );
			this.addChild( focus.view as StarlingSoulView );
			focus.x = -100;
			focus.y = -100;
			
			for ( var i:Number = 0; i < shotMax; i++ )
			{
				var soul:Soul = new Soul( new PussyShot );
				this.addChild( soul.view as StarlingSoulView );
				soul.x = - 100;
				soul.y = -100;
				soul.view.visible = false;	
				shots.push( soul );
			}
			
			copPositions.push( this.copPos1 );
			copPositions.push( this.copPos2 );
			copPositions.push( this.copPos3 );
			copPositions.push( this.copPos4 );
			copPositions.push( this.copPos5 );
			
			for ( var b:Number = 0; b < this.copAmount; b++ )
			{
				cop = new Soul( new Cop );
				var pos:Point = this.copPositions[ b ];
				cop.x = -400;
				cop.y = pos.y;
				cop.view.x = -400;
				cop.view.y = pos.y;
				this.addChild( cop.view  as StarlingSoulView );
				cop.addEventListener( CreationEvent.DEATH, copDeath );
				cop.name = String( b );
				this.cops.push( cop );
			}
			
			//this.addChild( shot.view as StarlingSoulView );
		}
		
		
		private function copDeath ( event:CreationEvent ):void
		{
			var pos:Point = this.copPositions[ Number( event.soul.name ) ];
			TweenMax.to( event.soul.view, 3, { y:pos.y, x: - 350, onComplete:checkLevelComplete  });
			copRemain -= 1;
			
		}
		
		protected function rollCop ( cop:Soul ):void
		{
			var pos:Point = this.copPositions[ Number( cop.name ) ];
			
			TweenMax.to( cop.view, 30, {	x:this.copPositions[ 2 ].x  , y:this.copPositions[ 2 ].y } );
		}
		
		protected function findCopTimeTravel ( start:Point, end:Point ):Number
		{
			var destXA:Number 	= start.x;
			var destYA:Number 	= start.y;
			
			var destXB:Number 	= end.x;
			var destYB:Number	= end.y;
			
			var distX:Number = destXA - destXB;
			var distY:Number = destYA - destYB;
			var dist:Number	= Math.sqrt( distX * distX + distY * distY );  
			
			return dist / 50; 
		}
		
		protected function driveCopComplete ( list:Array ):void
		{
			var currentCop:Soul = list[ 0 ];
			if ( currentCop == null ) return;
			driveCop( currentCop );
		}
		
		protected function driveCop ( cop:Soul ):void
		{
			var endPos:Point = this.copPositions[ Number( cop.name   ) ];
			
			var newEnd:Point = new Point( endPos.x , endPos.y );
			var randPosX:Number = Math.ceil( Math.random() * 100 ) * 4 ; 
			randPosX -= 200;
			
			
			newEnd.x += randPosX;
			var currentPos:Point = new Point( cop.view.x, cop.view.y );
			var time:Number = findCopTimeTravel( currentPos , newEnd ); 
			
			TweenMax.to( cop.view, time, {	x:newEnd.x  , y:newEnd.y, 
											onComplete:driveCopComplete, 
											ease:SlowMo.ease.config(0.2, 0.35),
											onCompleteParams:[[ cop ]] } );
		}
		
		private function resetCop ( cop:Soul ):void
		{
			cop.resetAllStats();
			cop.view.play( BrnrToon.IDLE );
			
		}
		
		
		private function checkLevelComplete ():void
		{
			
			if ( copRemain > 0 ) return;
			
			level += 1;
			//copRemain = this.copAmount;
			activeCops = new Array;
			
			switch ( level ) 
			{
				case 1:
				cop = this.cops[ 2 ];
				activeCops.push( cop );
				driveCop( cop );
				copRemain = 1;
				resetCop( cop );
				return
				break
				
				case 2:
				cop = this.cops[ 1 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop (cop );
				
				cop = this.cops[ 4 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop ( cop );
				copRemain = 2;
				return
				break
				
				case 3:
				cop = this.cops[ 0 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 2 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
				
				cop = this.cops[ 4 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
				
				copRemain = 3;
				return
				break;
				
				case 4:
				cop = this.cops[ 0 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 1 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 3 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 4 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				copRemain = 4;
				return
				break
				
				default:
				cop = this.cops[ 0 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 1 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 2 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				cop = this.cops[ 3 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
				
				
				cop = this.cops[ 4 ];
				activeCops.push( cop );
				driveCop( cop );
				resetCop( cop );
					
				copRemain = 5;	
			}
			
			
		}
		
		private function babeDeath ( event:CreationEvent ):void
		{
			
			TweenMax.to( babe.view, 4, {bezier:[{x:187, y:594}, {x:-300, y:519}], orientToBezier:true, onComplete:gameOver});
			//TweenMax.to( babe, 	1.5, { x:-300, delay:1.5  });
			TweenMax.to( horse, 1.5, { x:1300, delay:3 });
			this.activeCops = new Array;
			
			for ( var i:Number = 0; i < this.copAmount; i++ )
			{
				this.cop = this.cops[ i ];
				
				if ( cop == null ) continue;
				
				var pos:Point = this.copPositions[ i ];
				TweenMax.to( cop.view, .25, {  x: -350, y:pos.y });
			}
			
			this.copRemain = 0;
		}
		
		
		private function showTitle ():void
		{
			if ( title == null ) title = new TitleScreen;
			 this.addChild( title );
			
			title.y = title.height * -1;
			
			TweenMax.to( title, 2, { y:0, delay:2, ease:Elastic.easeInOut }); 
			
			this.addEventListener( TouchEvent.TOUCH, touchTitle );	
		}
		
		private function touchTitle ( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			if ( touch == null ) return; /// seems very weird 
			
			switch ( touch.phase )
			{
			case TouchPhase.ENDED: 
			startGame()
			break;
			}
		}
		
		private function startGame ():void
		{
			this.removeEventListener( TouchEvent.TOUCH, touchTitle );
			
			horse = new Soul( new Horse );
			
			horse.x = horseStart.x;
			horse.y = horseStart.y;
			horse.view.x = horseStart.x;
			horse.view.y = horseStart.y;
			
			this.addChild( horse.view as StarlingSoulView );
			
			horse.x = horseStart.x;
			horse.y = horseStart.y;
			horse.view.x = horseStart.x;
			horse.view.y = horseStart.y;
			
			babe = new Soul( new Babe );
			
			babe.x = babeStart.x;
			babe.y = babeStart.y;
			babe.view.x = babeStart.x;
			babe.view.y = babeStart.y;
			
			this.addChild( babe.view  as StarlingSoulView );
			
			babe.resetAllStats();
			babe.addEventListener( CreationEvent.DEATH, babeDeath );
			babe.addEventListener( CreationEvent.ACTIVATE, triggerShot );
			
			//babe.x = babeStart.x;
			//babe.y = babeStart.y;
			//babe.view.x = babeStart.x;
			//babe.view.y = babeStart.y;
			
			TweenMax.to( title, 2, { y:title.height * -1, ease:Elastic.easeInOut, onComplete:titleDone });
			TweenMax.to( horse, 2, { x:800, delay:2, onComplete:horseDone });
			TweenMax.to( babe, 2,  { x:890, delay:2, onComplete:showFocus });
			
			this.dispatchEvent( new Event( Event.TRIGGERED ) );
			
			this.addEventListener( Event.ENTER_FRAME, attackCheck );
		}
		
		private function horseDone ( ):void
		{
			checkLevelComplete();
		}
		
		private function attackCheck ( event:Event ):void
		{
			attackCount+=1;
			if ( attackCount < this.attackMax ) return;
			attackCount = 0 - Math.floor( Math.random() * 100 );
			attack();
		}
		
		private function showFocus ():void
		{
			updateFocus( 100, 500 );
		}
		
		private function titleDone ():void
		{
			this.addEventListener( TouchEvent.TOUCH, triggered );	
		}
		
		private function triggerShot ( event:CreationEvent ):void
		{
			
			focus.view.visible = true;
			
			var shot:Soul = this.shots[ this.currentShot ] as Soul;
			this.addChild( shot.view as StarlingSoulView );
			
			this.currentShot += 1;
			if ( this.currentShot >= this.shotMax ) this.currentShot = 0;
			
			shot.view.play( BrnrToon.IDLE );
			
			shot.view.visible = true;
			
			var destXA:Number 	= this.babe.x + 130;
			var destYA:Number 	= this.babe.y + 100
				
			var destXB:Number 	= babe.focalPoint.x + 70;
			var destYB:Number	= babe.focalPoint.y + 50;
			
			var distX:Number = destXA - destXB;
			var distY:Number = destYA - destYB;
			var dist:Number	= Math.sqrt( distX * distX + distY * distY );  
			
			var time:Number = dist / 500; 
			
			shot.view.x = destXA;
			shot.view.y = destYA;
				
			TweenMax.to( shot.view, time, {	bezier:[{x:destXA, y:destYA  }, {x:destXB  , y:destYB   }], 
											orientToBezier:true, 
											ease:SlowMo.ease.config(0.3, 0.65),
											onCompleteParams:[ [shot] ],
											onComplete:shotOver });  
		}
		
		protected function attack ():void
		{
			//return;
			
			var copNum:Number = Math.ceil( Math.random() * 10  * .5 );
			
			this.cop = activeCops[ copNum - 1 ];
			
			if ( this.cop == null ) return;
			
			if ( cop.statValue( BurnStat.CORE ) <= 0 ) return;
			
			var destXA:Number 	= this.cop.x;
			var destYA:Number 	= this.cop.y;
			
			var destXB:Number 	= babe.x - 200;
			var destYB:Number	= babe.y + 100;
			
			var distX:Number = destXA - destXB;
			var distY:Number = destYA - destYB;
			var dist:Number	= Math.sqrt( distX * distX + distY * distY );  
			
			var time:Number = dist / 500; 
			
			TweenMax.to( cop.view, time, {	bezier:[{x:destXA, y:destYA  }, {x:destXB  , y:destYB   }], 
				orientToBezier:false, 
				ease:SlowMo.ease.config(0.3, 0.65),
				onCompleteParams:[ [ cop, cop.view.x, cop.view.y ] ],
				onComplete:attackComplete });  
		}
		
		protected function attackComplete( group:Array ):void
		{
			var source:Soul = group[ 0 ];
			
			var destXA:Number 	= source.view.x; 
			var destYA:Number 	= source.view.y;
			
			var destXB:Number 	= group[ 1 ];
			var destYB:Number	= group[ 2 ];
			
			var distX:Number = destXA - destXB;
			var distY:Number = destYA - destYB;
			var dist:Number	= Math.sqrt( distX * distX + distY * distY );  
			
			var time:Number = dist / 500; 
			
			var damage:Number = Math.random() * 100 * -20;
			babe.updateStat( BurnStat.CORE, damage );
			
			this.driveCop( source );
		}
		
		private function shotOver( group:Array  ):void
		{
		
			var shot:Soul = group[0];
			//shot.view.visible = false;
			shot.view.play( BrnrToon.EXECUTE );
			
			var clip:ExtendedMovieClip;
			var copClip:ExtendedMovieClip;
			
			var bounds1:Rectangle;
			var bounds2:Rectangle;
			
			for ( var i:Number = 0; i < this.copAmount; i++ )
			{
				cop = this.cops[ i ];
				
				clip = shot.view as ExtendedMovieClip;
				copClip = cop.view as ExtendedMovieClip;;
				
				bounds1 = clip.bounds;
				bounds2 = copClip.bounds;
				
				if (bounds1.intersects(bounds2)) 
				{
					var damage:Number = Math.random() * -10 * 3;
					cop.updateStat( BurnStat.CORE, damage );
				}
						
				
			}
			
		}
		
		private function gameOver ():void
		{
			focus.view.visible = false;
			
			showTitle();
			
			level = 0;
			
			this.removeEventListener( TouchEvent.TOUCH, triggered );
			babe.removeEventListener( CreationEvent.DEATH, babeDeath );
			babe.removeEventListener( CreationEvent.ACTIVATE, triggerShot );
			this.removeChild( babe.view as StarlingSoulView );
			this.removeChild( horse.view as StarlingSoulView );
			this.removeEventListener( Event.ENTER_FRAME, attackCheck );
			
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function execute ( event:Event ):void
		{
			background.execute();
		}
		
		override public function addSoul ( soul:Soul ):void
		{
			soul.updateWorld( this.model.vs );
			this.addChild( soul.view as StarlingSoulView );
		}
		
		private function updateFocus( x:Number = 0, y:Number = 0 ):void
		{
			focalX 			= new FocalPointUpdateX( this.babe, x );
			focalY 			= new FocalPointUpdateY( this.babe, y );
			updateMode	 	= new ModeUpdate( this.babe );
			
			this.babe.emptyStat( BurnStat.FRICTION  ); 
			this.babe.emptyStat( BurnStat.EXCITE 	  );
			
			updateMode.subtype = BurnMode.UPDATE; 
			
			this.babe.action( this.focalX );
			this.babe.action( this.focalY );
			this.babe.action( this.updateMode );
			
			this.focus.x = x - this.focus.view.width *.5;
			this.focus.y = y - this.focus.view.height * .5;;
			focus.view.visible = true;
			this.addChild( focus.view as StarlingSoulView );
		}
		
		private function triggered ( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			if ( touch.globalX > 800 ) return;
			
			if ( touch == null ) return; /// seems very weird 
			
			switch ( touch.phase )
			{
				case TouchPhase.BEGAN: 
					if ( touch.target is Image )
					{
						var target:Image = touch.target as Image;
						if ( target.parent  is Babe ) return
						updateFocus( touch.globalX, touch.globalY );
					}
					
					break;
				
				case TouchPhase.MOVED: 
					//movieClip1.play("action");
					break;
				case TouchPhase.ENDED: 
					//movieClip1.play("idle");
					break;
			}
			
		}
	}
}
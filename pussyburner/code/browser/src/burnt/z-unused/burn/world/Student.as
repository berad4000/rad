package burnt.z-unused.burn.world
{
	import com.emibap.textureAtlas.DynamicAtlas;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import burnt.z-unused.burn.control.BurnControl;
	import burnt.z-unused.burn.model.BurnModelOLD;
	import burnt.rad.burn.world.objects.BurnMode;
	import burnt.rad.burn.world.objects.BurnStat;
	import vs.course.content.landscape.Landscape;
	import burnt.z-unused.burn.world.elements.WorldView;
	import burnt.rad.burn.world.souls.types.Bombshell;
	import burnt.rad.burn.world.souls.types.Babe;
	import burnt.rad.burn.ui.TitleScreen;
	import burnt.z-unused.vs.avatar.toons.Toon;
	import burnt.z-unused.Soul;
	import burnt.z-unused.soul.CreationFactory;
	import vs.creation.command.FocalPointUpdateX;
	import vs.creation.command.FocalPointUpdateY;
	import vs.creation.command.ModeUpdate;
	import burnt.z-unused.soul.content.StarlingSoulView;
	import vs.starling.StarlingWorld;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.ExtendedMovieClip;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Student extends StarlingWorld 
	{ 
		private var _title:TitleScreen; 
		private var _background:Landscape; 
		private var _sky:Image; 
		
		private var movieClip1:ExtendedMovieClip;
		private var movieClip2:ExtendedMovieClip;
		
		private var clipOn1:Boolean = false;
		private var clipOn2:Boolean = false;
		
		//GOOD STUFF
		public var souls:Dictionary 	= new Dictionary;
		public var soulList:Array 		= new Array;
		
		//soul stuff
		public var chat:Soul;
		protected var focalX:FocalPointUpdateX;
		protected var focalY:FocalPointUpdateY;
		protected var updateMode:ModeUpdate;
		
		public function Student(  )
		{
			//super( model, control );
		}
		
		//override public function awake ():void
		//{
		//	
			
		
			
			//chat = addSoul("chat");
			//focalX 			= new FocalPointUpdateX( chat );
			//focalY 			= new FocalPointUpdateY( chat );
			//updateMode	 	= new ModeUpdate( chat );
		//}
		
		override public function addSoul( soul:Soul ):Soul
		{
			//if ( souls[ id ] != null ) return  souls[ id ];
			
			//var soul:Soul = SoulFactory.instance().createSoul( id );
			//soul.x 	= x;
			//soul.y	= y;
			//soul.z 	= z;
			//soul.awake();
			
			//var view:StarlingSoul;
			
			//switch ( id.toUpperCase() )
			//{
			//	case "CHAT":
			//	view = new Chat;		
			//	break;
			//}
			
			//soul.appear( view );
			//this.addChild( soul.view as Chat );
			//Starling.juggler.add( view );
			
			return soul;
		}
		
		private function startSession( x:Number, y:Number ):void
		{
			this.focalX.value = x;
			this.focalY.value = y;
			
			chat.emptyStat( BurnStat.FRICTION 	);
			chat.emptyStat( BurnStat.EXCITE 	);
			
			updateMode.subtype = BurnMode.UPDATE;
			
			this.chat.action( this.focalX );
			this.chat.action( this.focalY );
			this.chat.action( this.updateMode );
		}
		
		private function triggered ( event:TouchEvent ):void
		{
			var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
			if ( touch == null ) return; /// seems very weird
			
			switch ( touch.phase )
			{
				case TouchPhase.BEGAN: 
					if ( touch.target is Image )
					{
						var target:Image = touch.target as Image;
						if ( target.parent  is Babe ) return
						startSession( touch.globalX, touch.globalY );
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
		
		private function startDrag ( touch:Touch ):void
		{
			if ( touch.target is Image )
			{
				var target:Image = touch.target as Image;
				if ( target.parent  is ExtendedMovieClip )
				{
					var clip:ExtendedMovieClip = target.parent as ExtendedMovieClip;
					if ( clip.name == "clip1" ) clipOn1 = true;
					if ( clip.name == "clip2" ) clipOn2 = true;
					trace(clip.name );
				}
			}
		}
		
		private function stopDrag ( touch:Touch ):void
		{
			if ( touch.target is Image )
			{
				var target:Image = touch.target as Image;
				if ( target.parent  is ExtendedMovieClip )
				{
					var clip:ExtendedMovieClip = target.parent as ExtendedMovieClip;
					if ( clip.name == "clip1" ) clipOn1 = false;
					if ( clip.name == "clip2" ) clipOn2 = false;
				}
			}
		}
		
		private function move ( touch:Touch ):void
		{
			var rec1:Rectangle = movieClip1.getBounds( this ); 
			var rec2:Rectangle = movieClip2.getBounds( this );
			var isColliding:Boolean = rec1.intersects( rec2 );
			
			if ( isColliding )
			{
				movieClip2.play("open");
			}
			else
			{
				movieClip2.setCurrentAnimation("close");
			}
			
			if ( clipOn1 == true )
			{
				movieClip1.x = touch.globalX;
				movieClip1.y = touch.globalY;
				return
			}
			
			if ( clipOn2 == true )
			{
				movieClip2.x = touch.globalX;
				movieClip2.y = touch.globalY;
				return
			}
			
			
		}
		
		//private function triggered ( event:TouchEvent ):void
		//{
		//	var touch:Touch = event.getTouch( event.currentTarget as DisplayObject ); 
		//	if ( touch == null ) return; /// seems very weird
			
		//	switch ( touch.phase )
		//	{
		//		case TouchPhase.BEGAN: 
		//			startDrag ( touch );
		//			break;
		//		case TouchPhase.MOVED: 
		//			move ( touch );
		//			break;
		//		case TouchPhase.ENDED: 
		//			stopDrag ( touch );
		//			break;
		//	}
			
		//}
		
		public function layout ():void
		{
			//var tex:Texture = new Texture();
			//var bombshell:MovieClip = new MovieClip( Assets.getTexture( "TestSquare" ) as Texture , 2 );
			//this.addChild( bombshell );
			//bombshell.scaleX = bombshell.scaleY = .3;
			
			//_background = new Background( 	this.model, 	this.control );
			//this.addChild( _background );
			
			//_title		= new TitleScreen( 		this.model, 	this.control );
			//this.addChild( _title );
			//_title.awake();
			
			//var mc:PussyBurnerToons = new PussyBurnerToons; 
			//var atlas:TextureAtlas = DynamicAtlas.fromMovieClipContainer(mc, 1, 0, true, true);
			//var boy_mc:MovieClip = new MovieClip(atlas.getTextures("blueSky"), 60);
			//boy_mc.x = boy_mc.y = 25;
			//addChild(boy_mc);
			
			//_background.addBase("BlueSky");
			//_background.addLayer("Clouds", .005, 0 );
			
			//_background.addLayer("Cloud6", .005, 100 );
			//_background.addLayer("Cloud4", .004, 20 );
			//_background.addLayer("Cloud5", .009, 20 );
			//_background.addLayer("Cloud2", .002, 55 );
			//_background.addLayer("Cloud3", .001 ); 
			//_background.addLayer("Cloud1", .003, 65 );
			
			//_background.addLayer("Grass", .2, 150 );
			//_background.addLayer("Highway", .3, 600 );
			//_background.addLayer("Foregound", .5, 660 );
			//_background.addLayer("Rail", .7, 660 );
			
			
			//model.speed = 100;
			
			//this.model.stage.addEventListener( TouchEvent.TOUCH, this.control.touch.environmentTouch );
		}
		
		public function execute():void
		{
			//_background.execute();
		}
		
	}
}
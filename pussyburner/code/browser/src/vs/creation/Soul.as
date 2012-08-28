package vs.creation
{
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import burnt.vs.creation.events.SoulEvent;
	import burnt.vs.creation.model.objects.StatValues;
	import vs.cosmos.VsWorld;

	public class Soul extends EventDispatcher
	{
		protected var model:SoulModel;
		protected var control:SoulControl;
		
		protected var _view:SoulView;
		
		public function Soul( view:SoulView = null )
		{
			model 		= new SoulModel( this );
			control 	= new SoulControl( model );
			
			model.self = this;
			
			if ( view != null ) this.appear( view );
			
			control.stat.addEventListener( SoulEvent.DEATH, newSoulEvent );
			control.stat.addEventListener( SoulEvent.PAIN, 	painEvent );
		}
		
		private function painEvent ( event:SoulEvent ):void
		{
			this.dispatchEvent( new SoulEvent( SoulEvent.PAIN, this, event.message ) );	
		}
		
		private function newSoulEvent ( event:SoulEvent ):void
		{
			this.dispatchEvent( new SoulEvent( SoulEvent.DEATH, this ) );	
		}
		
		public function appear ( view:SoulView ):void
		{
			_view = view;
			_view.awake( model, control );
		}
		
		public function action ( command:SoulCommand ):void
		{
			control.command.execute( command );
		}
		
		public function get focalPoint ():Point 					{ return this.model.focalPoint ;  }
		public function updateFocalX ( value:Number ):void 			{ control.updateFocalX( value )  };
		public function updateFocalY ( value:Number ):void 			{ control.updateFocalY( value )  };
		
		public function statValue ( id:String ):Number 				{ return control.stat.fetchStatValue( id ); }
		public function statMax	  ( id:String ):Number				{ return control.stat.fetchStatMax( id ) };
		public function addStat ( item:StatValues ):void			{ control.stat.addStat( item ); }
		public function updateStat( id:String , value:Number ):void { control.stat.updateStat( id, value ); }
		public function emptyStat ( id:String ):void				{ control.stat.emptyStat(  id ); }
		
		public function updateMode ( mode:String ):void 			{ control.mode.updatePrimaryMode( mode ); }
		public function updateWorld ( world:VsWorld ):void			{ control.updateWorld( world ); }		
		
		public function awake():void
		{
			
		}
		
		public function activate():void
		{
			this.dispatchEvent( new SoulEvent( SoulEvent.ACTIVATE ) );
		}
		
		public function resetAllStats ():void
		{
			this.control.stat.resetAll();
		}
		
		public function birth( type:String ):Soul
		{  
			if ( this.view == null ) return null;
			return this.view.birth( type );
		}
		
		
		public function end():void
		{	
			model 		= null;
			control 	= null;
		}
		
		public function get view ():SoulView
		{
			return _view;
		}
		
		public function get id ():String 					{ return model.id; }
		public function get world():VsWorld					{ return model.world; }
		
		
		public function set name ( value:String ):void 		{ this.model.name = value    		    }
		public function get name ():String 					{ return model.name; 			}
		public function set x ( value:Number ):void 		{ this.model.x = value    		}
		public function get x ():Number 					{ return model.x; 				}
		public function set y ( value:Number ):void 		{ this. model.y = value     	}
		public function get y ():Number 					{ return model.y; 	}
		public function set z ( value:Number ):void   		{ this.model.z = value    		}
		public function get z ():Number 					{ return model.z	}
		
		public function set rotation ( value:Number ):void 	{      }
		
		public function alive 		( /*event here*/ ):void{}
		
		public function pain 		( /*event here*/ ):void { }
		public function pleasure 	( /*event here*/ ):void { }
		
		public function death		( event:SoulEvent ):void { }
		
	}
}
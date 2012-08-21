package rad.vs.soul.controls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import rad.vs.soul.SoulControl;
	import rad.vs.soul.SoulModel;
	import rad.vs.soul.events.SoulEvent;
	import rad.vs.soul.events.StatEvent;
	import rad.vs.soul.model.objects.StatTypes;
	import rad.vs.soul.model.objects.StatValues;
	import rad.vs.soul.model.stat.CoreStat;
	import rad.vs.soul.model.stat.EmptyStat;
	import rad.vs.soul.model.stat.FillStat;
	import rad.vs.soul.model.stat.LimitlessMaxStat;
	import rad.vs.soul.model.stat.LimitlessMinStat;
	import rad.vs.soul.model.stat.LimitlessStat;
	import rad.vs.soul.model.stat.Stat;

	public class StatControl extends EventDispatcher
	{
		private var _model:SoulModel;
		private var _control:SoulControl;
		
		public function StatControl( model:SoulModel)
		{
			_model = model;	
		}
		
		public function isStatMaxed ( id:String ):Boolean
		{
			var maxed:Boolean = false;
			
			var stat:Stat = fetchStat( id ); 
			if ( stat.value == stat.max ) maxed = true;

			return maxed;
		}
		
		public function emptyStat ( id:String ):void
		{
			var stat:Stat = fetchStat( id );
			stat.value = stat.min;
		}
		
		public function fillStat ( id:String ):void
		{
			var stat:Stat = fetchStat( id );
			stat.value = stat.max;
		}
		
		public function batchStatValues ( group:Array ):void
		{
			var max:Number = group.length;
			
			for ( var i:Number = 0; i < max; i++ )
			{
				var item:StatValues = group[ i ];
				addStat( item );
			}
		}
		
		public function addStat ( item:StatValues ):void 
		{
			var stat:Stat = this.fetchStat( item.id, item.type );
			stat.id 	= item.id.toUpperCase();
			stat.max 	= item.max;
			stat.min	= item.min;
			stat.value 	= item.value;
		}
		
		public function fetchStatValue ( id:String ):Number
		{
			var stat:Stat = this.fetchStat( id.toUpperCase() );
			return stat.value;
		}
		
		public function fetchStatMax ( id:String ):Number
		{
			var stat:Stat = this.fetchStat( id.toUpperCase() );
			return stat.max;
		}
		
		public function fetchStat ( id:String, type:String = null ):Stat
		{
			if ( _model.body.stats[ id.toUpperCase() ] != null ) return _model.body.stats[ id.toUpperCase() ];
			
			var stat:Stat = new Stat;
			stat.id = id.toUpperCase();
			
			if ( type != null )
			{
				switch ( type ) 
				{
					case StatTypes.CORE:
					stat = new CoreStat;
					break;
					
					case StatTypes.EMPTY:
					stat = new EmptyStat;
					break;
					
					case StatTypes.FILL:
					stat = new FillStat
					break;
					
					case StatTypes.LIMITLESS:
					stat = new LimitlessStat;
					break;
					
					case StatTypes.LIMITLESS_MAX:
					stat = new LimitlessMaxStat;
					break;
					
					case StatTypes.LIMITLESS_MIN:
					stat = new LimitlessMinStat;
					break
				}
				
			}
			
			_model.body.stats[ id.toUpperCase() ] = stat;
			_model.body.statList.push( _model.body.stats[ id.toUpperCase() ] );
			
			return stat;
		}
		
		public function change (id:String , value:Number ):void
		{
			
		}
		
		public function updateStat( id:String , value:Number ):void
		{
			var stat:Stat = _model.body.stats[ id.toUpperCase() ];
			if ( stat == null ) return;
				
			stat.value += value;
			
			if ( (  stat is EmptyStat ) && ( stat.value <= stat.min ) ) this.dispatchEvent( new StatEvent( StatEvent.EMPTY, _model.self, stat ) );
			if ( (  stat is FillStat  ) && ( stat.value >= stat.max ) ) this.dispatchEvent( new StatEvent( StatEvent.FILL, 	_model.self, stat ) );
			
			if ( stat is CoreStat )
			{
				if ( value < 0 ) 				this.dispatchEvent( new SoulEvent( SoulEvent.PAIN, 	_model.self, String( value ) ) );  
				if ( stat.value <= stat.min )	this.dispatchEvent( new SoulEvent( SoulEvent.DEATH, _model.self ) );
			}
		}
		
		public function reset( ):void
		{
			_model.body.reset();
		}
			
		public function resetAll( ):void
		{
			var max:int = _model.body.statList.length;
			
			for ( var i:int; i < max; i++ )
			{
				var stat:Stat = _model.body.statList[ i ];
				stat.reset();
			}
		}
		
	
	}
}
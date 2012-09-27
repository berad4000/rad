package vs.creation.control.elements
{
	import vs.creation.core.CreationCore;
	import vs.creation.core.elements.stat.CoreStat;
	import vs.creation.core.elements.stat.EmptyStat;
	import vs.creation.core.elements.stat.FillStat;
	import vs.creation.core.elements.stat.LimitlessMaxStat;
	import vs.creation.core.elements.stat.LimitlessMinStat;
	import vs.creation.core.elements.stat.LimitlessStat;
	import vs.creation.core.elements.stat.Stat;
	import vs.creation.core.elements.stat.StatTypes;
	import vs.creation.core.elements.stat.StatValues;

	public class StatControl
	{
		
		protected var core:CreationCore;
		
		public function StatControl( core:CreationCore )
		{
			this.core = core;
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
		
		//public function batchStatValues ( group:Array ):void
		//{
		//	var max:Number = group.length;
			
		//	for ( var i:Number = 0; i < max; i++ )
		//	{
		//		var item:StatValues = group[ i ]; 
		//		addStat( item );
		//	}
		//}
		
		public function addStat ( id:String, value:Number,  min:Number,  max:Number, type:String ):void 
		{
			var stat:Stat = this.fetchStat( id, type );
			stat.id 	= id.toUpperCase();
			stat.max 	= max;
			stat.min	= min;
			stat.value 	= value;
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
			if ( core.body.stats[ id.toUpperCase() ] != null ) return core.body.stats[ id.toUpperCase() ];
			
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
			
			core.body.stats[ id.toUpperCase() ] = stat;
			core.body.statList.push( core.body.stats[ id.toUpperCase() ] );
			
			return stat;
		}
		
		public function change (id:String , value:Number ):void
		{
			
		}
		
		public function updateStat( id:String , value:Number ):void
		{
			var stat:Stat = core.body.stats[ id.toUpperCase() ];
			if ( stat == null ) return;
			
			stat.value += value;
			
			//NO EVENT DISPATCHERS IN THE PIECES
			//if ( (  stat is EmptyStat ) && ( stat.value <= stat.min ) ) this.dispatchEvent( new StatEvent( StatEvent.EMPTY, _model.self, stat ) );
			//if ( (  stat is FillStat  ) && ( stat.value >= stat.max ) ) this.dispatchEvent( new StatEvent( StatEvent.FILL, 	_model.self, stat ) );
			
			if ( stat is CoreStat )
			{
				//if ( value < 0 ) 				this.dispatchEvent( new CreationEvent( CreationEvent.PAIN, 	_model.self, String( value ) ) );  
				//if ( stat.value <= stat.min )	this.dispatchEvent( new CreationEvent( CreationEvent.DEATH, _model.self ) );
			}
		}
		
		public function reset( ):void
		{
			core.body.reset();
		}
		
		public function resetAll( ):void
		{
			var max:int = core.body.statList.length;
			
			for ( var i:int; i < max; i++ )
			{
				var stat:Stat = core.body.statList[ i ];
				stat.reset();
			}
		}
		
	}
}
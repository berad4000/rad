package vs.cosmos
{
	import vs.creation.Soul;

	public class VsWorld
	{
		protected var model:CosmosCore;
		protected var control:CosmosControl;
		
		private var _view:CosmosContent;
		
		public function VsWorld()
		{
		}
		
		public function get view ():CosmosContent { return _view }
		
		public function appear ( view:CosmosContent ):void
		{
			_view = view;
			_view.awake( model, control );
		}
			
		public function addSoul ( soul:Soul ):void 
		{
			//_view.addSoul( soul );
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.model.width 	= width;
			this.model.height 	= height;
		}
		
		public function awake ():void { }
	}
}
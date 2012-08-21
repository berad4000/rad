package rad.vs.world
{
	import rad.vs.soul.Soul;

	public class VsWorld
	{
		protected var model:VsModel;
		protected var control:VsControl;
		
		private var _view:WorldView;
		
		public function VsWorld()
		{
			this.model = new VsModel;
			this.control = new VsControl;
			
			this.model.vs = this;
		}
		
		public function get view ():WorldView { return _view }
		
		public function appear ( view:WorldView ):void
		{
			_view = view;
			_view.awake( model, control );
		}
			
		public function addSoul ( soul:Soul ):void 
		{
			_view.addSoul( soul );
		}
		
		public function updateSize( width:Number, height:Number ):void 
		{ 
			this.model.width 	= width;
			this.model.height 	= height;
		}
		
		public function awake ():void { }
	}
}
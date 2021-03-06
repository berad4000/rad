package xo.creation.form.z
{
	import xo.creation.X0CreationLibrary;
	import xo.creation.foundation.X0Creation;
	import xo.creation.form.queen.quirk.Focus;
	import xo.creation.form.queen.Queen;

	public class Avatar extends X0Creation
	{
		
		protected var mount:Mount;
		protected var queen:Queen;
		protected var focus:Focus;
		
		public function Avatar(){}
		
		override public function setUp():void
		{
			super.setUp();
			
			this.mount = this.course.creation( X0CreationLibrary.MOUNT, 100, 100 ) 		as Mount;
			this.queen = this.course.creation( X0CreationLibrary.QUEEN, 100, -100 ) 		as Queen;
			this.focus = this.course.creation( X0CreationLibrary.FOCUS, 0 , 0 ) 			as Focus
			
			//this.queen.focus = this.focus;	
			//this.queen.parent = this.mount;
		}
		
		override public function set x ( value:Number )	:void	{ this.mount.x = value }
		override public function get x ()				:Number	{ return this.mount.x  }
		override public function set y ( value:Number )	:void	{ this.mount.y = value }
		override public function get y ()				:Number	{ return this.mount.y  } 
	}
}
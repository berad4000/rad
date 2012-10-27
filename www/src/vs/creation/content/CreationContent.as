package vs.creation.content
{
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import starling.display.ExtendedMovieClip;
	
	import vs.Creation;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;
	
	public class CreationContent extends ExtendedMovieClip
	{
		protected var core:CreationCore; 
		protected var control:CreationControl;
		
		public function CreationContent()
		{
		}
		
		public function get creation():Creation { return this.core.self } 
		
		public function awake( core:CreationCore, control:CreationControl ):void
		{
			this.core 		= core;
			this.control 	= control;
			appear();
			addCauses();
		}
		
		public function collideCheck ( creation:Creation):Boolean
		{
			if ( this.core == null ) 					return false;
			if ( this.core.collideList == null ) 		return false;
			
			if ( collidePass0 ( creation ) == false ) 	return false;
			if ( collidePass1 ( creation ) == false ) 	return false;
			return true
		}
		
		private function collidePass0 ( target:Creation ):Boolean
		{
			var collide:Boolean = false;
			
			var p1:Point = new Point(this.core.x, this.core.y); 
			var p2:Point = new Point(target.x, target.y);
			
			var distance:Number = Point.distance(p1, p2);
			var radius1:Number = this.width / 2;
			var radius2:Number = target.width / 2;
			
			var radComplete:Number = radius1 + radius2;
			if (distance < radComplete ) collide = true;
			
			return collide;
		}
		
		private function collidePass1 ( target:Creation ):Boolean
		{
			var collide:Boolean = false;
			
			var bounds1:Rectangle = this.bounds;  
			var bounds2:Rectangle = target.bounds;
			
			if (bounds1.intersects(bounds2)) collide = true;
			
			return collide
		}
		
		public function addCauses():void {}
		
		public function appear():void 
		{
			//got to get this working
			if ( this.core == null ) return;
			this.x = this.core.x;
			this.y = this.core.y;
		}
		
		public function removeCauses():void {}
		
		//public function execute ( event:Event = null ):void	{}
		public function action ():void						{}
		public function move ():void
		{
			if ( this.core == null ) return;
			this.x = this.core.x;
			this.y = this.core.y;
		}
	}
}
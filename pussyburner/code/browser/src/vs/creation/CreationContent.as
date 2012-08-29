package vs.creation
{
	import vs.Creation;
	
	public interface CreationContent
	{
		function awake( model:CreationCore, control:CreationControl ):void;
		function birth ( type:String ) :Creation;
		function get x ():Number;
		function set x ( value:Number):void;
		function get y ():Number;
		function set y ( value:Number):void;
		function get height ():Number;
		function get width  ():Number;
		function set visible (value:Boolean ):void
		function get visible ():Boolean;
		function play(animName:String=""):void
	
	}
}
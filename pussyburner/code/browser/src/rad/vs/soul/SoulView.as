package rad.vs.soul
{
	
	public interface SoulView
	{
		function awake( model:SoulModel, control:SoulControl ):void;
		function birth ( type:String ) :Soul;
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
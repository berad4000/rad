package xo.creation
{
	import xo.creation.form.queen.Queen;
	import xo.creation.form.queen.climax.Missle;
	import xo.creation.form.queen.fascinator.Fascinator;
	import xo.creation.form.queen.quirk.Body;
	import xo.creation.form.queen.quirk.Lust;
	import xo.creation.form.queen.quirk.Flow;
	import xo.creation.form.queen.quirk.Focus;
	import xo.creation.form.queen.quirk.Friction;
	import xo.creation.form.queen.toy.Toy;
	import xo.creation.form.z.Avatar;
	import xo.creation.form.z.Baddie;
	import xo.creation.form.z.HorseOLD;
	import xo.creation.form.z.Mount;

	public class X0CreationLibrary
	{
		//QUEEN CREATION
		static public 	var 	QUEEN:String		= "queen.Queen";
		protected 		var 	queen:Queen;
		
		//QUEEN QUIRKS
		static public 	var  	BODY:String			="queen.quirk.Body";
		protected 		var 	body:Body;
		
		static public 	var 	DESIRE:String		="queen.quirk.Desire";
		protected 		var 	desire:Lust;
		
		static public 	var 	FLOW:String			="queen.quirk.Flow";
		protected 		var 	flow:Flow;
		
		static public 	var		FOCUS:String		= "queen.quirk.Focus";
		protected 		var 	foucus:Focus;
		
		static public	var 	FRICTION:String		= "queen.quirk.Friction";
		protected		var 	friction:Friction;
		
		//CLIMAXES
		static public	var 	MISSLE:String		= "queen.quirk.Missle";
		protected 		var 	missle:Missle;
		
		
		//TOYS
		static public 	var 	TOY:String			= "queen.quirk.Toy";
		static public 	var		toy:Toy;
		
		
		//FASCINATORS
		static public 	var 	FASCINATOR:String	= "queen.fascinator.Fascinator";
		protected var 			fascinator:Fascinator;
		
		
		public function X0CreationLibrary()
		{
		}
	}
}
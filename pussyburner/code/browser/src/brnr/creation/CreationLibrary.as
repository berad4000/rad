package brnr.creation
{
	import brnr.creation.form.queen.Queen;
	import brnr.creation.form.queen.climax.Missle;
	import brnr.creation.form.queen.fascinator.Fascinator;
	import brnr.creation.form.queen.quirk.Body;
	import brnr.creation.form.queen.quirk.Desire;
	import brnr.creation.form.queen.quirk.Flow;
	import brnr.creation.form.queen.quirk.Focus;
	import brnr.creation.form.queen.quirk.Friction;
	import brnr.creation.form.queen.toy.Toy;
	import brnr.creation.form.z.Avatar;
	import brnr.creation.form.z.Baddie;
	import brnr.creation.form.z.HorseOLD;
	import brnr.creation.form.z.Mount;

	public class CreationLibrary
	{
		//QUEEN CREATION
		static public 	var 	QUEEN:String		= "queen.Queen";
		protected 		var 	queen:Queen;
		
		//QUEEN QUIRKS
		static public 	var  	BODY:String			="queen.quirk.Body";
		protected 		var 	body:Body;
		
		static public 	var 	DESIRE:String		="queen.quirk.Desire";
		protected 		var 	desire:Desire;
		
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
		
		
		public function CreationLibrary()
		{
		}
	}
}
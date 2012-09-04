package brnr.creation
{
	import brnr.creation.form.Bombshell;
	import brnr.creation.form.Focus;
	import brnr.creation.form.Horse;
	import brnr.creation.form.PssyHorse;

	public class CreationLibrary
	{
		
		protected var horse:Horse;
		
		static public var PSSYHORSE:String = "PssyHorse";
		protected var pssyHorse:PssyHorse;
		
		static public var FOCUS:String		= "Focus";
		protected var focus:Focus;
		
		static public var BOMBSHELL:String = "Bombshell";
		static public var bombshell:Bombshell;
		
		public function CreationLibrary()
		{
		}
	}
}
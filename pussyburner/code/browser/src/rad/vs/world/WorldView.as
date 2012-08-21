package rad.vs.world
{
	import rad.vs.soul.Soul;
	
	public interface WorldView
	{
		function awake		( model:VsModel, control:VsControl ):void
		function addSoul 	( soul:Soul ):void
			
	}
}
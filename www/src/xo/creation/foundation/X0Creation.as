package xo.creation.foundation
{
	import xo.creation.foundation.elements.X0CreationContent;
	import xo.creation.foundation.elements.X0CreationControl;
	import xo.creation.foundation.elements.X0CreationCore;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;

	public class X0Creation extends Creation
	{
		
		protected var brnrCore:X0CreationCore;
		protected var brnrControl:X0CreationControl;
		protected var brnrContent:X0CreationContent;
		
		public function X0Creation()
		{
		}
		
		override public function awake(core:CreationCore=null, control:CreationControl=null, content:CreationContent=null):void
		{
			
			if ( core == null )		this.brnrCore  		= new X0CreationCore( this );
			if ( control == null )	this.brnrControl 	= new X0CreationControl(  this.brnrCore );
			if ( content == null ) 	this.brnrContent 	= new X0CreationContent;
			if ( content != null ) 	this.brnrContent 	= content as X0CreationContent;
			//if ( content != null ) this.content = this.brnrContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
		}
	}
}
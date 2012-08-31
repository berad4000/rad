package brnr.creation.foundation
{
	import brnr.creation.foundation.elements.BrnrCreationContent;
	import brnr.creation.foundation.elements.BrnrCreationControl;
	import brnr.creation.foundation.elements.BrnrCreationCore;
	
	import vs.Creation;
	import vs.creation.content.CreationContent;
	import vs.creation.control.CreationControl;
	import vs.creation.core.CreationCore;

	public class BrnrCreation extends Creation
	{
		
		protected var brnrCore:BrnrCreationCore;
		protected var brnrControl:BrnrCreationControl;
		protected var brnrContent:BrnrCreationContent;
		
		public function BrnrCreation()
		{
		}
		
		override public function awake(core:CreationCore=null, control:CreationControl=null, content:CreationContent=null):void
		{
			
			if ( core == null )		this.brnrCore  		= new BrnrCreationCore( this );
			if ( control == null )	this.brnrControl 	= new BrnrCreationControl(  this.brnrCore );
			if ( content == null ) 	this.brnrContent 	= new BrnrCreationContent;
			if ( content != null ) 	this.brnrContent 	= content as BrnrCreationContent;
			//if ( content != null ) this.content = this.brnrContent;
			
			super.awake( this.brnrCore, this.brnrControl, this.brnrContent );
			this.brnrContent.awake( this.brnrCore, this.brnrControl );
		}
	}
}
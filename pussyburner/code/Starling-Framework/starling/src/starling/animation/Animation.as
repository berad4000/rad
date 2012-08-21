package starling.animation
{
	import flash.media.Sound;
	
	import starling.textures.Texture;
	
	public class Animation
	{
		public var Textures:Vector.<Texture>;
		public var Sounds:Vector.<Sound>;
		public var Durations:Vector.<Number>;
		public var StartTimes:Vector.<Number>;
		
		public var DefaultFrameDuration:Number;
		public var TotalTime:Number;
		public var Loop:Boolean;
		
		/** An Animation is a single instance of one Animation for an ExtendedMovieClip.
		 */
		public function Animation(textures:Vector.<Texture>, fps:Number=12, loop:Boolean=true)
		{
			if (textures.length > 0)
			{
				DefaultFrameDuration = 1.0 / fps;
				Loop = loop;
				TotalTime = 0.0;
				Textures = new <Texture>[];
				Sounds = new <Sound>[];
				Durations = new <Number>[];
				StartTimes = new <Number>[];
				
				for (var i:int = 0; i < textures.length; i++)
				{
					addFrameAt(i, textures[i]);
				}
			}
			else
			{
				throw new ArgumentError("Empty texture array");
			}
		}
		
		/** Adds a frame at a certain index, optionally with a sound and a custom duration. */
		public function addFrameAt(frameID:int, texture:Texture, sound:Sound=null, 
								   duration:Number=-1):void
		{
			if (frameID < 0 || frameID > Textures.length) throw new ArgumentError("Invalid frame id");
			if (duration < 0) duration = DefaultFrameDuration;
			
			Textures.splice(frameID, 0, texture);
			Sounds.splice(frameID, 0, sound);
			Durations.splice(frameID, 0, duration);
			TotalTime += duration;
			
			if (frameID > 0 && frameID == Textures.length) 
				StartTimes[frameID] = StartTimes[frameID-1] + Durations[frameID-1];
			else
				updateStartTimes();
		}
		
		/** Returns the duration of a certain frame (in seconds). */
		public function getFrameDuration(frameID:int):Number
		{
			if (frameID < 0 || frameID >= Textures.length) throw new ArgumentError("Invalid frame id");
			return Durations[frameID];
		}
		
		/** Sets the duration of a certain frame (in seconds). */
		public function setFrameDuration(frameID:int, duration:Number):void
		{
			if (frameID < 0 || frameID >= Textures.length) throw new ArgumentError("Invalid frame id");
			TotalTime -= getFrameDuration(frameID);
			TotalTime += duration;
			Durations[frameID] = duration;
			updateStartTimes();
		}
		
		/** Returns the texture of a certain frame. */
		public function getFrameTexture(frameID:int):Texture
		{
			if (frameID < 0 || frameID >= Textures.length) throw new ArgumentError("Invalid frame id");
			return Textures[frameID];
		}
		
		/** Sets the texture of a certain frame. */
		public function setFrameTexture(frameID:int, texture:Texture):void
		{
			if (frameID < 0 || frameID >= Textures.length) throw new ArgumentError("Invalid frame id");
			Textures[frameID] = texture;
		}
		
		private function updateStartTimes():void
		{
			var numFrames:int = Textures.length;
			
			StartTimes.length = 0;
			StartTimes[0] = 0;
			
			for (var i:int=1; i<numFrames; ++i)
				StartTimes[i] = StartTimes[i-1] + Durations[i-1];
		}
		
		/** Returns the sound of a certain frame. */
		public function getFrameSound(frameID:int):Sound
		{
			if (frameID < 0 || frameID >= Textures.length) throw new ArgumentError("Invalid frame id");
			return Sounds[frameID];
		}
		
		/** Sets the sound of a certain frame. The sound will be played whenever the frame 
		 *  is displayed. */
		public function setFrameSound(frameID:int, sound:Sound):void
		{
			if (frameID < 0 || frameID >= Textures.length) throw new ArgumentError("Invalid frame id");
			Sounds[frameID] = sound;
		}
		
		/** The default number of frames per second. Individual frames can have different 
		 *  durations. If you change the fps, the durations of all frames will be scaled 
		 *  relatively to the previous value. */
		public function get fps():Number { return 1.0 / DefaultFrameDuration; }
		public function set fps(value:Number):void
		{
			var newFrameDuration:Number = value == 0.0 ? Number.MAX_VALUE : 1.0 / value;
			var acceleration:Number = newFrameDuration / DefaultFrameDuration;
			DefaultFrameDuration = newFrameDuration;
			
			for (var i:int=0; i<Textures.length; ++i)
				setFrameDuration(i, getFrameDuration(i) * acceleration);
		}
		
		public function dispose():void
		{
			Textures = null;
			Sounds = null;
			Durations = null;
			StartTimes = null;
		}
	}
}
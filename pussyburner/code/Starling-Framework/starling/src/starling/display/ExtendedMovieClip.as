// =================================================================================================
//
//	Starling Framework
//	Copyright 2011 Gamua OG. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.display
{
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import starling.animation.Animation;
	import starling.animation.IAnimatable;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/** Dispatched whenever the movie has displayed its last frame. */
	[Event(name="complete", type="starling.events.Event")]
	
	/** An ExtendedMovieClip functions almost exactly the same way that MovieClip does, but can
	 *	multiple Animations instead of just one single animation.  For each new Animation, call
	 *	addAnimation on the ExtendedMovieClip, which takes the same parameters that MovieClip does.
	 */
	public class ExtendedMovieClip extends Sprite implements IAnimatable
	{
		private var mCurrentTime:Number;
		private var mCurrentFrame:int;
		private var mPlaying:Boolean;
		private var mAnimations:Dictionary; // so we can do lookups by animation name
		private var mImage:Image;
		private var mCurrentAnimation:Animation;
		private var mAutoDiscardAnimations:Boolean; // if true, all Animation instances in mAnimations will be disposed when this instance is disposed
		
		public function ExtendedMovieClip(autoDiscardAnimations:Boolean=true)
		{
			mAnimations = new Dictionary();
			mPlaying = false;
			mCurrentTime = 0.0;
			mCurrentFrame = 0;
			mAutoDiscardAnimations = autoDiscardAnimations;
		}
		
		public function addAnimation(animName:String, textures:Vector.<Texture>, fps:Number=12, loop:Boolean=true):Animation
		{
			if (textures.length > 0)
			{				
				mAnimations[animName] = new Animation(textures, fps, loop);
				
				if (!mImage) // if this is the first animation, we won't have an image created, so do that now
				{
					mImage = new Image(textures[0]);
					addChild(mImage);
					mCurrentAnimation = mAnimations[animName]; // if this is the first animation added, set it as the current
				}
			}
			else
			{
				throw new ArgumentError("Empty texture array");
			}
			
			return mAnimations[animName];
		}
		
		public function addAnimationReference(animName:String, animation:Animation):Animation
		{			
			mAnimations[animName] = animation;
			
			if (!mImage) // if this is the first animation, we won't have an image created, so do that now
			{
				mImage = new Image(animation.Textures[0]);
				addChild(mImage);
				mCurrentAnimation = mAnimations[animName]; // if this is the first animation added, set it as the current
			}
			
			return animation;
		}
		
		public function get Color():uint
		{
			return mImage.color;
		}
		
		public function set Color(color:uint):void
		{
			mImage.color = color; 
		}
		
		// frame manipulation
		
		public function getAnimation(animName:String):Animation
		{
			if (mAnimations[animName])
			{
				return mAnimations[animName];
			}
			else
			{
				throw new ArgumentError("Invalid animation name");
			}
		}
		
		// playback methods
		
		public function setCurrentAnimation(animName:String):void
		{
			if (mAnimations[animName])
			{
				mCurrentFrame = 0; // reset to first frame
				mCurrentAnimation = mAnimations[animName];
				mImage.texture = mCurrentAnimation.Textures[mCurrentFrame];
				mImage.height = mImage.texture.height; 	//new line
				mImage.width = mImage.texture.width; 	// new line
			}
			else
			{
				throw new ArgumentError("Invalid animation name");
			}
		}
		
		/** Starts playback. Beware that the clip has to be added to a juggler, too! */
		public function play(animName:String=""):void
		{
			if (animName == "" && mCurrentAnimation)
			{
				mPlaying = true;
			}
			else
			{
				if (mAnimations[animName])
				{
					this.setCurrentAnimation( animName );
					mPlaying = true;
				}
				else
				{
					//throw new ArgumentError("Invalid animation name");
				}
			}
		}
		
		/** Pauses playback. */
		public function pause():void
		{
			mPlaying = false;
		}
		
		/** Stops playback, resetting "currentFrame" to zero. */
		public function stop():void
		{
			mPlaying = false;
			currentFrame = 0;
		}
		
		// IAnimatable
		
		/** @inheritDoc */
		public function advanceTime(passedTime:Number):void
		{
			var finalFrame:int;
			var previousFrame:int = mCurrentFrame;
			
			if (mCurrentAnimation.Loop && mCurrentTime == mCurrentAnimation.TotalTime) { mCurrentTime = 0.0; mCurrentFrame = 0; }
			if (!mPlaying || passedTime == 0.0 || mCurrentTime == mCurrentAnimation.TotalTime) return;
			
			mCurrentTime += passedTime;
			finalFrame = mCurrentAnimation.Textures.length - 1;
			
			while (mCurrentTime >= mCurrentAnimation.StartTimes[mCurrentFrame] + mCurrentAnimation.Durations[mCurrentFrame])
			{
				if (mCurrentFrame == finalFrame)
				{
					if (hasEventListener(Event.COMPLETE))
					{
						var restTime:Number = mCurrentTime - mCurrentAnimation.TotalTime;
						mCurrentTime = mCurrentAnimation.TotalTime;
						dispatchEvent(new Event(Event.COMPLETE));
						
						// user might have changed movie clip settings, so we restart the method
						advanceTime(restTime);
						return;
					}
					
					if (mCurrentAnimation.Loop)
					{
						mCurrentTime -= mCurrentAnimation.TotalTime;
						mCurrentFrame = 0;
					}
					else
					{
						mCurrentTime = mCurrentAnimation.TotalTime;
						break;
					}
				}
				else
				{
					mCurrentFrame++;
					
					var sound:Sound = mCurrentAnimation.Sounds[mCurrentFrame];
					if (sound) sound.play();
				}
			}
			
			if (mCurrentFrame != previousFrame)
				mImage.texture = mCurrentAnimation.Textures[mCurrentFrame];
		}
		
		/** Indicates if a (non-looping) movie has come to its end. */
		public function get isComplete():Boolean 
		{
			return !mCurrentAnimation.Loop && mCurrentTime >= mCurrentAnimation.TotalTime;
		}
		
		// properties  
		
		/** The total duration of the clip in seconds. */
		public function get totalTime():Number { return mCurrentAnimation.TotalTime; }
		
		/** The total number of frames. */
		public function get numFrames():int { return mCurrentAnimation.Textures.length; }
		
		/** The index of the frame that is currently displayed. */
		public function get currentFrame():int { return mCurrentFrame; }
		public function set currentFrame(value:int):void
		{
			mCurrentFrame = value;
			mCurrentTime = 0.0;
			
			if (!mCurrentAnimation)
			{
				return;
			}
			
			for (var i:int=0; i<value; ++i)
				mCurrentTime += mCurrentAnimation.getFrameDuration(i);
			
			mImage.texture = mCurrentAnimation.Textures[mCurrentFrame];
			if (mCurrentAnimation.Sounds[mCurrentFrame]) mCurrentAnimation.Sounds[mCurrentFrame].play();
		}
		
		/** The default number of frames per second. Individual frames can have different 
		 *  durations. If you change the fps, the durations of all frames will be scaled 
		 *  relatively to the previous value. */
		public function get fps():Number { return mCurrentAnimation.fps; }
		
		/** Indicates if the clip is still playing. Returns <code>false</code> when the end 
		 *  is reached. */
		public function get isPlaying():Boolean 
		{
			if (mPlaying)
				return mCurrentAnimation.Loop || mCurrentTime < mCurrentAnimation.TotalTime;
			else
				return false;
		}
		
		public override function dispose():void
		{
			mCurrentAnimation = null;
			
			if (mAutoDiscardAnimations)
			{
				for each (var animation:Animation in mAnimations)
				{
					animation.dispose();
				}
			}
			mAnimations = null;
			
			if (mImage)
			{
				removeChild(mImage);
				mImage.dispose();
				mImage = null;
			}
			
			super.dispose();
		}
	}
}
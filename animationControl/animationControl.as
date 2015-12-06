package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;

	public class animationControl extends MovieClip {

		var myWhoosh: Sound = new whoosh(); // Sound from http://soundscrate.com/search.html?query=whoosh
		var myWaterSound: Sound = new water();
		var myFireSound: Sound = new fire_1();
		var mySoundChannel: SoundChannel = new SoundChannel(); //You need a sound channel to be able to stop sounds
		var firePlaybackStatus: Boolean = false;

		public function animationControl() {

			trace("This is working so far!");

			arrow1.stop();
			fire1.stop();
			myWaterDroplet.stop();

			arrow1.addEventListener(MouseEvent.CLICK, fireArrow);
			fire1.addEventListener(MouseEvent.CLICK, runFire);
			myWaterDroplet.addEventListener(MouseEvent.CLICK, dropWater);
			mySoundChannel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
			stage.addEventListener(Event.ENTER_FRAME, checkCollisions);


		}

		function fireArrow(event: MouseEvent): void {

			trace(event.currentTarget.name); // Tells me the name of the object that was clicked

			arrow1.play();
			myWhoosh.play();

		}


		function runFire(event: MouseEvent): void {

			if (fire1.currentLabel == "animated") {

				fire1.gotoAndStop(1);
				mySoundChannel.stop();
				trace(mySoundChannel);
				firePlaybackStatus = false;

			} else {

				fire1.gotoAndPlay(2);
				mySoundChannel = myFireSound.play();
				firePlaybackStatus = true;

			}
			//myWhoosh.play();

		}

		function dropWater(e: MouseEvent): void {

			myWaterDroplet.gotoAndPlay(1);
			myWaterSound.play();

		}


		function checkCollisions(e: Event): void {


			// First if statement
			if (arrow1.hitTestObject(fire1)) {

				fire1.gotoAndPlay(2);

				trace(firePlaybackStatus);

				if (firePlaybackStatus == false) {
					mySoundChannel = myFireSound.play();
					firePlaybackStatus = true;
				}
				
					trace(firePlaybackStatus);

			} else {

				//mySoundChannel.stop();
			}

			// Second if statement

			if (myWaterDroplet.hitTestObject(fire1)) {

				fire1.gotoAndStop(1);
				mySoundChannel.stop();
				firePlaybackStatus = false;
			}
		}


		function onPlaybackComplete(e: Event): void {

			firePlaybackStatus = false;
		}
	}
}
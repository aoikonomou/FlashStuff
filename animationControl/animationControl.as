package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;


	public class animationControl extends MovieClip {

		var myWhoosh: Sound = new whoosh(); // Sound from http://soundscrate.com/search.html?query=whoosh

		public function animationControl() {
			// constructor code

			trace("andreas");
			arrow1.stop();
			arrow1.addEventListener(MouseEvent.CLICK, fireArrow);

		}

		function fireArrow(event: MouseEvent): void {

			trace("I am in the firing function");

			arrow1.play();
			myWhoosh.play();

		}

	}

}
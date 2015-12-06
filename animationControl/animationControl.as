package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.events.Event;

	public class animationControl extends MovieClip {

		var myWhoosh: Sound = new whoosh(); // Sound from http://soundscrate.com/search.html?query=whoosh

		public function animationControl() {
			// constructor code

			trace("This is working so far!");
			
			arrow1.stop();
			fire1.stop();
			
			arrow1.addEventListener(MouseEvent.CLICK, fireArrow);
			fire1.addEventListener(MouseEvent.CLICK, runFire);
			stage.addEventListener(Event.ENTER_FRAME, checkCollisions);

		}

		function fireArrow(event: MouseEvent): void {

			trace("I am in the arrow firing function");

			arrow1.play();
			myWhoosh.play();

		}


		function runFire(event: MouseEvent): void {

		

			if(fire1.currentLabel == "animated"){
				
				fire1.gotoAndStop(1);
				
				
				} else {
					
					fire1.gotoAndPlay(2);
					
					}
			//myWhoosh.play();

		}

		function checkCollisions(e: Event): void {


			if (arrow1.hitTestObject(fire1)) {

				fire1.gotoAndPlay(2);

			} else {

				//trace("You either missed or you haven't fired yet!");

			}
		}
	}
}
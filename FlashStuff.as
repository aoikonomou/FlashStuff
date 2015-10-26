package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class FlashStuff extends MovieClip {


		public function FlashStuff() {
			// constructor code

			Gary.addEventListener(MouseEvent.MOUSE_DOWN, DragMe);
			Gary.addEventListener(MouseEvent.MOUSE_UP, StopDraggingMe);

			
			// This is Gary's initial position on the stage
			
			Gary.x = 500;
			Gary.y = 300;

		}


		function DragMe(e: MouseEvent): void {

			Gary.startDrag();

		}

		function StopDraggingMe(e: MouseEvent): void {

			Gary.stopDrag();

		}

	}

}
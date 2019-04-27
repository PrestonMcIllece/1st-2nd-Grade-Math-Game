/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the teacher access screen.
 */

package States
{
	//our class imports
	import Core.Assets;
	import Core.Game;
	
	import Interfaces.IState;
	
	import Objects.Background;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Teacher extends Sprite implements IState
	{
		//INSTANCE VARIABLES
		private var game:Game;
		private var background:Background;
		private var soon:Button;
		
		/**
		 * Constructor - calls init() function.
		 */
		public function Teacher(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Initializes the background to the screen.
		 */
		private function init(event:Event):void
		{	
			background = new Background();
			addChild(background);
			
			soon = new Button(Assets.ta.getTexture("buttonpng"), "STUFF COMING SOON");
			soon.addEventListener(Event.TRIGGERED, sendHome);
			soon.height = 500;
			soon.width = 500;
			soon.x = 100;
			soon.y = 100;
			soon.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(soon);
		}
		
		/**
		 * Sends player back to home screen.
		 */
		public function sendHome(): void {
			game.changeState(Game.MENU_STATE);
		}
		
		/**
		 * Updates the scrolling background.
		 */
		public function update():void
		{
			background.update();
		}
		
		/**
		 * Destroys the background and elements.
		 */
		public function destroy():void
		{
		}
	}
}
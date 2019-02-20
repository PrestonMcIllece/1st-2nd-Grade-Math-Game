package Core
{
	import Interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import States.Menu;
	import States.Play;
	import States.GameOver;
	import States.SingleDigits;
	import States.PlaceGame;
	
	public class Game extends Sprite
	{
		//Reference the three game states via a constant value.
		public static const MENU_STATE:int = 0;
		public static const PLAY_STATE:int = 1;
		public static const GAME_OVER_STATE:int = 2;
		public static const SINGLE_DIGITS:int = 3;
		public static const PLACE_GAME:int = 4;
		
		//What is the current visible state?
		private var current_state:IState;
		
		public function Game()
		{
			//Initialize assets.
			Assets.init();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * The initial state function.
		 */
		private function init(event:Event):void
		{
			changeState(MENU_STATE);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		/**
		 * Allows us to change the state of our game.
		 */
		public function changeState(state:int):void
		{
			if(current_state != null)
			{
				current_state.destroy();
				current_state = null;
			}
			
			//Now create the switch statement.
			switch(state){
				case MENU_STATE:
					current_state = new Menu(this);
					break;
				
				case PLAY_STATE:
					current_state = new Play(this);
					break;
				
				case GAME_OVER_STATE:
					current_state = new GameOver(this);
					break;
				
				case SINGLE_DIGITS:
					current_state = new SingleDigits(this);
					break;
				
				case PLACE_GAME:
					current_state = new PlaceGame(this);
					break;
			}
			
			addChild(Sprite(current_state));
		}
		
		private function update(event:Event):void
		{
			current_state.update();
		}
	}
}

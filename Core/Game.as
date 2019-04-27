/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Game class that initializes the various game states (game screens, home screen, win screen, etc).
 */

package Core
{
	//Import Flox.cc server
	import com.gamua.flox.Player;
	import com.gamua.flox.Flox;
	//Imports from our classes
	import Interfaces.IState;
	import States.Menu;
	import States.PlaceGame;
	import States.PlaceGameOver;
	import States.Play;
	import States.SingleDigits;
	import States.SingleGameOver;
	import States.Teacher;
	import States.DoubleDigits;
	import States.DoubleGameOver;
	import States.SingleCert;
	import States.DoubleCert;
	import States.PlaceCert;
	import States.BonusGame;
	import States.BonusGameOver;
	import States.BonusCert;
	//Starling imports
	import starling.display.Sprite;
	import starling.events.Event;
	//Flash imports for button text
	import flash.text.TextField;
	
	public class Game extends Sprite
	{
		//Reference the three game states via a constant value.
		public static const MENU_STATE:int = 0;
		public static const PLAY_STATE:int = 1;
		public static const SINGLE_GAME_OVER:int = 2;
		public static const SINGLE_DIGITS:int = 3;
		public static const PLACE_GAME:int = 4;
		public static const DOUBLE_GAME_OVER:int = 5;
		public static const PLACE_GAME_OVER:int = 6;
		public static const TEACHER_LOGIN:int = 7;
		public static const DOUBLE_DIGITS:int = 8;
		public static const SINGLE_CERT:int = 9;
		public static const DOUBLE_CERT:int = 10;
		public static const PLACE_CERT:int = 11;
		public static const BONUS:int = 12;
		public static const BONUS_GAME_OVER:int = 13;
		public static const BONUS_CERT:int = 14;
		
		//What is the current visible state?
		private var current_state:IState;
		
		//Capturing login text
		private var myTextBox:TextField = new TextField(); 
		private var myOutputBox:TextField = new TextField(); 
		private var myText:String = "Type your text here."; 
		
		/**
		 * Game constructor, calls the init() function.
		 */
		public function Game()
		{
			//Initialize assets.
			Assets.init();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * The initial state function, initializes the game.
		 */
		private function init(event:Event):void
		{
			changeState(MENU_STATE);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		/**
		 * Allows us to change the state of our game (menu, play, single digits, etc.).
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
				
				case SINGLE_GAME_OVER:
					current_state = new SingleGameOver(this);
					break;
				
				case SINGLE_DIGITS:
					current_state = new SingleDigits(this);
					break;
				
				case PLACE_GAME:
					current_state = new PlaceGame(this);
					break;
				
				case DOUBLE_GAME_OVER:
					current_state = new DoubleGameOver(this);
					break;
				
				case PLACE_GAME_OVER:
					current_state = new PlaceGameOver(this);
					break;
				
				case TEACHER_LOGIN:
					current_state = new Teacher(this);
					break;
				
				case DOUBLE_DIGITS:
					current_state = new DoubleDigits(this);
					break;
				
				case SINGLE_CERT:
					current_state = new SingleCert(this);
					break;
				
				case DOUBLE_CERT:
					current_state = new DoubleCert(this);
					break;
				
				case PLACE_CERT:
					current_state = new PlaceCert(this);
					break;
				
				case BONUS:
					current_state = new BonusGame(this);
					break;
				
				case BONUS_GAME_OVER:
					current_state = new BonusGameOver(this);
					break;
				
				case BONUS_CERT:
					current_state = new BonusCert(this);
					break;
			
			}
			
			addChild(Sprite(current_state));
		}
		
		/**
		 * Updates the screen background to show moving stars.
		 */
		private function update(event:Event):void
		{
			current_state.update();
		}
	}
}
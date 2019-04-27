/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the single digits game over and score.
 */

package States
{
	//flox imports to save score
	import com.gamua.flox.Flox;
	import com.gamua.flox.Player;
	
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import Core.Assets;
	import Core.Game;
	
	import Interfaces.IState;
	
	import Objects.Background;
	import Objects.MyPlayer;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class BonusGameOver extends Sprite implements IState
	{
		//INSTANCE VARIABLES
		private var game:Game;
		private var background:Background;
		private var winner:Button;
		private var home:Button;
		private var print:Button;
		private var score:String;
		private var text:TextField;
		private var message:String;
		private var cert:Button;
		private var shiaSound:Sound;
		
		/**
		 * Constructor - calls the init() function.
		 */
		public function BonusGameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Init() function that initializes the game background, buttons, and score. 
		 */
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);
			
			Player.current.refresh(
				function onComplete(player:Player) {
					//The player has now been refreshed and represents the server state. We can
					//continue with the game logic.
				},
				function onError(message:String) {
					//An error occurred: Handle it.
				}
			);
			
			var score:int = BonusGame.getScore();
			var current:Player = Player.current;
			
			Flox.postScore("spacemath---bonusgame", score, current.id);
			
			shiaSound = new Sound();
			shiaSound.load(new URLRequest("shia.mp3"));
			shiaSound.play();
			
			if (score >= 80 && BonusGame.complete >= 10) {
				message = " YOU WIN! \n SCORE: " + String(score) + "%\n PROBLEMS: " + String(BonusGame.complete) + " \n \n \n "
				//button to generate a certificate with the player's name
				cert = new Button(Assets.ta.getTexture("buttonpng"), "PRINT CERTIFICATE");
				cert.addEventListener(Event.TRIGGERED, generateCert);
				cert.height = 80;
				cert.width = 180;
				cert.x = 0;
				cert.y = 10;
				cert.textFormat.setTo("PT Sans Caption", 45, 0xffffff);
				
			} else {
				message = "SCORE: " + String(score) + "%\n PROBLEMS: " + String(BonusGame.complete) + " \n \n \n"
			}
			
			//message = String(SingleDigits.correctCount) + "\n" + String(SingleDigits.incorrectCount);
			
			//winner button displaying the game score
			winner = new Button(Assets.ta.getTexture("transparentwin"),"\n" + message + "\n");
			winner.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			winner.height = 700;
			winner.width = 720;
			winner.x = 0;
			winner.y = 10;
			addChild(winner)
			
			//button to return to game screen
			home = new Button(Assets.ta.getTexture("play"));
			home.addEventListener(Event.TRIGGERED, homeScreen);
			home.textFormat.setTo("PT Sans Caption", 50, 0xffffff);
			home.height = 200;
			home.width = 400;
			home.x = 120;
			home.y = 400;
			addChild(home);
			
			if (score >= 80) {
				addChild(cert);
			}
			
		}
		
		/**
		 * Function to regurn to the game play state.
		 */
		private function homeScreen(event:Event): void
		{
			game.changeState(Game.PLAY_STATE);
			//shiaSound.close();
		}
		
		/**
		 * Function to regurn to the game play state.
		 */
		private function generateCert(event:Event): void
		{
			game.changeState(Game.BONUS_CERT);
			//shiaSound.close();
		}
		
		/**
		 * Updates the game scrolling background.
		 */
		public function update():void
		{
			background.update();
		}
		
		/**
		 * Destroys the game and background elements.
		 */
		public function destroy():void
		{
		}
	}
}
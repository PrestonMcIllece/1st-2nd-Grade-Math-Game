/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the single digits game over and score.
 */

package States
{
	//flox imports to save score
	import com.gamua.flox.Flox;
	import com.gamua.flox.Player;
	
	import Core.Assets;
	import Core.Game;
	
	import Interfaces.IState;
	import Objects.MyPlayer;
	import Objects.Background;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	
	public class SingleGameOver extends Sprite implements IState
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
		
		/**
		 * Constructor - calls the init() function.
		 */
		public function SingleGameOver(game:Game)
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
			
			var score:int = SingleDigits.getScore();
			var current:Player = Player.current;
			
			Flox.postScore("spacemath-leaderboard", score, current.id);
			
			if (score >= 100) {
				MyPlayer.single = true;
			}
			
			if (score >= 80) {
				message = " YOU WIN! \n SCORE: " + String(score) + "%\n \n \n "
				//button to generate a certificate with the player's name
				cert = new Button(Assets.ta.getTexture("buttonpng"), "PRINT CERTIFICATE");
				cert.addEventListener(Event.TRIGGERED, generateCert);
				cert.height = 80;
				cert.width = 180;
				cert.x = 0;
				cert.y = 10;
				cert.textFormat.setTo("PT Sans Caption", 45, 0xffffff);
				
			} else {
				message = "SCORE: " + String(score) + "%\n" + " Keep Going! \n \n \n"
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
			
			
			//navigate to URL is not working
			/**
			print.addEventListener(MouseEvent.CLICK, onClick);
			function onClick(e:MouseEvent):void{
				navigateToURL(new URLRequest("page.html"), "_self"); // change "_self" to "_blank" if want to it open in other tab or window. More info in the links I wrote below.
			}
			*/
		}
		
		/**
		 * Function to regurn to the game play state.
		 */
		private function homeScreen(event:Event): void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		/**
		 * Function to regurn to the game play state.
		 */
		private function generateCert(event:Event): void
		{
			game.changeState(Game.SINGLE_CERT);
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
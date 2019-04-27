/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the number place game over screen and score.
 */

package States
{
	//our class imports
	import com.gamua.flox.Flox;
	import com.gamua.flox.Player;
	
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
	
	//Flox.playerClass = MyPlayer;
	
	public class PlaceGameOver extends Sprite implements IState
	{
		//INSTANCE VARIABLES
		private var game:Game;
		private var background:Background;
		private var winner:Button;
		private var home:Button;
		private var cert:Button;
		private var score:String;
		private var text:TextField;
		private var message:String;
		
		/**
		 * Constructor - calls the init() function.
		 */
		public function PlaceGameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Function that initializes the background, score, and game screen buttons.
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
			
			var score: int = PlaceGame.getScore();
			//var current:MyPlayer = Player.current as MyPlayer;
			var current:Player = Player.current;
			
			Flox.postScore("spacemath---placegame", score, current.id);
			
			if (score >= 80) {
				message = " YOU WIN! \n SCORE: " + String(score) + "%\n \n"
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
			
			//winner button with score
			winner = new Button(Assets.ta.getTexture("transparentwin"), message);
			winner.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			winner.height = 700;
			winner.width = 720;
			winner.x = 0;
			winner.y = 10;
			addChild(winner)
			
			//return to home screen button
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
			
			if (score == 100) {
				MyPlayer.place = true;
			}
			
		}
		
		/**
		 * Function that returns user to game screen.
		 */
		private function homeScreen(event:Event): void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		/**
		 * Function that returns user to generate a certificate.
		 */
		private function generateCert(event:Event): void
		{
			game.changeState(Game.PLACE_CERT);
		}
		
		/**
		 * Updates the scrolling star background.
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
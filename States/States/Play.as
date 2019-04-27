/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Play class that shows the available game to play as buttons.
 */

package States
{
	//Our class imports
	import flash.media.Sound;
	import flash.net.URLRequest;
	import Core.Assets;
	import Core.Game;
	import Interfaces.IState;
	//import Objects.MyPlayer;
	import Objects.Background;
	import Objects.Mouse;
	import Objects.MyPlayer;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	public class Play extends Sprite implements IState
	{
		//Instance variables
		private var game:Game;
		private var background:Background;
		private var rocket:Mouse;
		private var play:Button;
		private var place:Button;
		private var single:Button;
		private var double:Button;
		private var home:Button;
		private var planet:Button;
		private var buttonText:TextFormat;
		private var problems:Array;
		private var answers:Array;
		private var problem:String;
		private var shiaCount:int = 0;
		private var shia:Boolean;
		
		/**
		 * Constructor - calls the init function. 
		 */
		public function Play(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Initializes the game - background, rocket mouse icon, game buttons. 
		 */
		private function init(event:Event):void
		{
			
			background = new Background();
			addChild(background);
			
			//Rocket mouse
			rocket = new Mouse(this);
			addChild(rocket);
			
			//single digits game button
			single = new Button(Assets.ta.getTexture("buttonpng"), "SINGLE DIGITS");
			single.addEventListener(Event.TRIGGERED, singleDigits);
			single.height = 200;
			single.width = 400;
			single.x = 150;
			single.y = 40;
			single.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(single);
			
			//place game button
			place = new Button(Assets.ta.getTexture("buttonpng"), "PLACE GAME");
			place.addEventListener(Event.TRIGGERED, placeGame);
			place.height = 200;
			place.width = 400;
			place.x = 150;
			place.y = 255;
			place.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(place);
			
			//double digits game button
			double = new Button(Assets.ta.getTexture("buttonpng"), "DOUBLE DIGITS");
			double.addEventListener(Event.TRIGGERED, doubleDigits);
			double.height = 200;
			double.width = 400;
			double.x = 150;
			double.y = 470;
			double.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(double);
			
			//Adds the home button
			home = new Button(Assets.ta.getTexture("buttonpng"), "HOME");
			home.addEventListener(Event.TRIGGERED, sendHome);
			home.width = 125;
			home.height = 50;
			home.x = background.width/2 - 75;
			home.y = 680;
			home.textFormat.setTo("PT Sans Caption", 25, 0xffffff);
			addChild(home);
			
			//sound effect for the state
			var rocketSound:Sound = new Sound();
			rocketSound.load(new URLRequest("Comet.mp3"));
			rocketSound.play();
			
			//If all games have been played with a score of 100, add the bonus game.
			//if (MyPlayer.single == true && MyPlayer.double == true && MyPlayer.place == true) {
			if (MyPlayer.single == true && MyPlayer.double == true && MyPlayer.place == true) {
				//bonus planet
				planet = new Button(Assets.ta.getTexture("planetpng"), "PLAY\nME");
				planet.addEventListener(Event.TRIGGERED, onPlanet);
				planet.height = 225;
				planet.width = 300;
				planet.x = background.width - 230;
				planet.y = 540;
				//planet.textFormat.setTo("PT Sans Caption", 25, 0xffffff);
				planet.textFormat.size = 45;
				addChild(planet);
				shia = true;
				
			}
			
		}
		
		/**
		 * Event listener when the single digit button is clicked, change game state. 
		 */
		private function singleDigits(event:Event): void
		{
			game.changeState(Game.SINGLE_DIGITS);
		}
		
		/**
		 * Event listener when the place game button is clicked, change game state. 
		 */
		private function placeGame(event:Event): void
		{
			game.changeState(Game.PLACE_GAME);
		}
		
		/**
		 * Event listener when the place game button is clicked, change game state. 
		 */
		private function doubleDigits(event:Event): void
		{
			game.changeState(Game.DOUBLE_DIGITS);
		}
		
		/**
		 * onPlanet method that sends the player to a teacher screen that will require a pin. 
		 */
		private function onPlanet(event:Event): void{
			game.changeState(Game.BONUS);
			var krabby:Sound = new Sound();
			krabby.load(new URLRequest("krabby_patty.mp3"));
			krabby.play();
		}
		
		/**
		 * Sends player back to home screen.
		 */
		public function sendHome(): void {
			game.changeState(Game.MENU_STATE);
		}
		
		/**
		 * Updates the moving star background and rocket mouse.
		 */
		public function update():void
		{
			background.update();
			rocket.update();
			shiaCount++;
			
//			if (shia == true && shiaCount == 500) {
//				var shiaSound:Sound = new Sound();
//				shiaSound.load(new URLRequest("shia.mp3"));
//				shiaSound.play();
//			}
		}
		
		/**
		 * Method to remove everything from the background.
		 */
		public function destroy():void
		{
			background.removeFromParent(true);
			background = null;
			single.removeFromParent(true);
			single = null;
			place.removeFromParent(true);
			place = null;
			removeFromParent(true);
		}
	}
}

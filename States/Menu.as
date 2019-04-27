/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the main menu for the game. 
 */

package States
{
	//flox.cc import
	import com.gamua.flox.Player;
	//our class imports
	import Core.Assets;
	import Core.Game;
	import Interfaces.IState;
	import Objects.Background;
	import Objects.MyPlayer;
	//flash/starling imports
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import flash.events.TextEvent;
	import flash.text.TextFieldType;
	
	public class Menu extends Sprite implements IState
	{
		//INSTANCE VARIABLES
		private var game:Game;
		private var background:Background;
		private var logo:Image;
		private var play:Button;
		private var teachButton:Button;
		private var planet:Button;
		//public var flashVars:Object = this.root.loaderInfo.parameters
		
		/**
		 * Constructor - that calls init() functionn.
		 */
		public function Menu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Init() function initializes the game with background, play and teacher buttons. 
		 */
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);
			
			//Adds the SPACEMATH logo
			logo = new Image(Assets.ta.getTexture("logo"));
			logo.width = 550;
			logo.pivotX = (logo.width * 0.5);
			logo.x = 275;
			logo.y = 150;
			addChild(logo);
			
			//Adds the play button
			play = new Button(Assets.ta.getTexture("play"));
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.width = 500;
			play.height = 200;
			play.pivotX = (play.width * 0.5);
			play.x = 350;
			play.y = (logo.y + 150);
			addChild(play);
			
			//Adds the teacher button
			teachButton = new Button(Assets.ta.getTexture("buttonpng"), "TEACHER");
			teachButton.addEventListener(Event.TRIGGERED, onTeacher);
			teachButton.width = 125;
			teachButton.height = 50;
			teachButton.x = 25;
			teachButton.y = 625;
			teachButton.textFormat.setTo("PT Sans Caption", 25, 0xffffff);
			addChild(teachButton);
			
			teachButton.visible = false;
			
		}
		
		/**
		* This onPlay method starts the game by sending the player to the game options screen; and
		* onPlay [TEMPORARILY] logins in the player with the HERO key from FLOX.
		*/
		private function onPlay(event:Event): void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		/**
		 * onTeacher method that sends the player to a teacher screen that will require a pin. 
		 */
		private function onTeacher(event:Event): void{
			game.changeState(Game.TEACHER_LOGIN);
		}
		
		/**
		 * onPlanet method that sends the player to a teacher screen that will require a pin. 
		 */
		private function onPlanet(event:Event): void{
			game.changeState(Game.BONUS);
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
			background.removeFromParent(true);
			background = null;
			logo.removeFromParent(true);
			logo = null;
			play.removeFromParent(true);
			play = null;
			removeFromParent(true);
		}
	}
}

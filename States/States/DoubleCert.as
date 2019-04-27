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
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class DoubleCert extends Sprite implements IState
	{
		//INSTANCE VARIABLES
		private var game:Game;
		private var background:Background;
		private var cert:Button;
		private var home:Button;
		private var score:String;
		private var text:TextField;
		private var message:String;
		private var fname:String;
		private var lname:String;
		private var player:MyPlayer;
		
		/**
		 * Constructor - calls the init() function.
		 */
		public function DoubleCert(game:Game)
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
			
			//capture the current player, and their name properties.
			//player = Player.current as MyPlayer;
			fname = MyPlayer.fname;
			lname = MyPlayer.lname;
			
			var name:String = fname + " " + lname
			message = "Rachel Luker" //temp message
			
			//certificate button with name and score, clicking returns to game screen.
			cert = new Button(Assets.ta2.getTexture("double"), "\n" + name);
			cert.addEventListener(Event.TRIGGERED, homeScreen);
			cert.textFormat.setTo("PT Sans Caption", 60, 0xffffff);
			cert.height = 700;
			cert.width = 720;
			cert.x = 0;
			cert.y = 10;
			addChild(cert)
			
		}
		
		/**
		 * Function that returns user to game screen.
		 */
		private function homeScreen(event:Event): void
		{
			game.changeState(Game.PLAY_STATE);
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
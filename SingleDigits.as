package States
{
	import Core.Assets;
	import Core.Game;
	
	import Interfaces.IState;
	
	import Objects.Background;
	import Objects.Player;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextFormat;
	import flash.net.URLVariables;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	
	public class SingleDigits extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var rocket:Player;
		private var play:Button;
		private var add:Button;
		private var subtract:Button;
		private var progress:Button;
		private var buttonText:TextFormat;
		private var problems:Array;
		private var answers:Array;
		private var problem:String;
		
		public function SingleDigits(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			problems = new Array("8 ? 1 = 9", "6 ? 1 = 5", "14 ? 1 = 15");
			answers = new Array("+","-","+");
			problem  = problems[0];
		}
		
		private function init(event:Event):void
		{
			
			background = new Background();
			addChild(background);
			
			//progress button
			progress = new Button(Assets.ta.getTexture("rocket"));
			progress.height = 100;
			progress.width = 100;
			progress.x = 0;
			progress.y = 650;
			addChild(progress);
			
			//play button
			play = new Button(Assets.ta.getTexture("buttonpng"), problem);
			play.height = 400;
			play.width = 460;
			play.x = 40;
			play.y = 150;
			play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(play);
			
			//addition button
			add = new Button(Assets.ta.getTexture("addition"));
			add.addEventListener(Event.TRIGGERED, onAdd);
			add.height = 150;
			add.width = 150;
			add.x = 520;
			add.y = 175;
			addChild(add);
			
			//subtraction button
			subtract = new Button(Assets.ta.getTexture("subtract"));
			subtract.addEventListener(Event.TRIGGERED, onSubtract);
			subtract.height = 150;
			subtract.width = 150;
			subtract.x = 520;
			subtract.y = 375;
			addChild(subtract);
			

		}
		
		private function onAdd(event:Event): void {
			
			var index:int = problems.indexOf(problem);
			if (answers[index] == "+") {
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					play.visible = false;
					//play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem);
					play.height = 400;
					play.width = 460;
					play.x = 40;
					play.y = 150;
					play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
					addChild(play);
					var yesSound:Sound = new Sound();
					yesSound.load(new URLRequest("yes.mp3"));
					yesSound.play();
					progress.x += 100;
				} else {
					var clap:Sound = new Sound();
					clap.load(new URLRequest("clap.mp3"));
					clap.play();
					game.changeState(Game.MENU_STATE);
				}
				
			} else {
				var noSound:Sound = new Sound();
				noSound.load(new URLRequest("no.mp3"));
				noSound.play();
			}
			return
		}
		
		
		private function onSubtract(event:Event): void
		{
//			// Create A new URLVariables instance to store the variable
//			var myVariables:URLVariables = new URLVariables();
//			
//			// Create a variable (e.g. username) to send
//			myVariables.username = "CMONNN";
//			
//			// Create a new URLRequest instance sending data to php
//			var myRequest:URLRequest = new URLRequest("testConnection.php");
//			
//			// Send data using the POST method
//			myRequest.method = URLRequestMethod.POST;
//			
//			// The data property of the request is set to the
//			// URLVariables instance (myVariables) to send to the PHP file.
//			// Note: myVariables stored the variable (e.g. candidate)
//			myRequest.data = myVariables;
			
			var index:int = problems.indexOf(problem);
			if (answers[index] == "-") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					play.visible = false;
					//play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem);
					play.height = 400;
					play.width = 460;
					play.x = 40;
					play.y = 150;
					play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
					addChild(play);
					var yesSound:Sound = new Sound();
					yesSound.load(new URLRequest("yes.mp3"));
					yesSound.play();
				} else {
					var clap:Sound = new Sound();
					clap.load(new URLRequest("clap.mp3"));
					clap.play();
					game.changeState(Game.MENU_STATE);
				}
			} else {
				var noSound:Sound = new Sound();
				noSound.load(new URLRequest("no.mp3"));
				noSound.play();
				return
			}
		}
		
		public function update():void
		{
			background.update();
		}
		
		public function destroy():void
		{
		}
	}
}
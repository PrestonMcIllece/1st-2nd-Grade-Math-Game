package States
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import Core.Assets;
	import Core.Game;
	
	import Interfaces.IState;
	
	import Objects.Background;
	import Objects.Player;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	public class PlaceGame extends Sprite implements IState
	{
		//instance variables
		private var game:Game;
		private var background:Background;
		private var rocket:Player;
		private var play:Button;
		private var zero:Button;
		private var one:Button;
		private var two:Button;
		private var three:Button;
		private var four:Button;
		private var five:Button;
		private var six:Button;
		private var seven:Button;
		private var eight:Button;
		private var nine:Button;
		private var progress:Button;
		private var buttonText:TextFormat;
		private var problems:Array;
		private var answers:Array;
		private var places:Array;
		private var problem:String;
		private var problem2:String;
		private var hundreds:String;
		private var tens:String;
		private var ones:String;
		
		public function PlaceGame(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		
			hundreds = "Which number is in the HUNDREDS place?";
			tens = "Which number is in the TENS place?";
			ones = "Which number is in the ONES place?";
			
			problems = new Array("147", "298", "985", "763");
			places = new Array(hundreds,tens,ones,tens);
			answers = new Array("1", "9", "5", "6");
			problem  = problems[0];
			problem2 = places[0];
		}
		
		private function init(event:Event):void
		{
			
			background = new Background();
			addChild(background);
			
			//progress rocket
			progress = new Button(Assets.ta.getTexture("rocket"));
			progress.height = 90;
			progress.width = 90;
			progress.x = 0;
			progress.y = 670;
			addChild(progress);
			
			//question button
			play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
			play.height = 300;
			play.width = 650;
			play.x = 40;
			play.y = 100;
			play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(play);
			
			//zero button
			zero = new Button(Assets.ta.getTexture("zero"));
			zero.addEventListener(Event.TRIGGERED, onZero);
			zero.height = 100;
			zero.width = 90;
			zero.x = 120;
			zero.y = 450;
			addChild(zero);
			
			//one button
			one = new Button(Assets.ta.getTexture("one"));
			one.addEventListener(Event.TRIGGERED, onOne);
			one.height = 90;
			one.width = 90;
			one.x = 220;
			one.y = 450;
			addChild(one);
			
			//two button
			two = new Button(Assets.ta.getTexture("two"));
			two.addEventListener(Event.TRIGGERED, onTwo);
			two.height = 90;
			two.width = 90;
			two.x = 320;
			two.y = 450;
			addChild(two);
			
			//three button
			three = new Button(Assets.ta.getTexture("three"));
			three.addEventListener(Event.TRIGGERED, onThree);
			three.height = 90;
			three.width = 90;
			three.x = 420;
			three.y = 450;
			addChild(three);
			
			//four button
			four = new Button(Assets.ta.getTexture("four"));
			four.addEventListener(Event.TRIGGERED, onFour);
			four.height = 90;
			four.width = 90;
			four.x = 520;
			four.y = 450;
			addChild(four);
			
			//five button
			five = new Button(Assets.ta.getTexture("five"));
			five.addEventListener(Event.TRIGGERED, onFive);
			five.height = 90;
			five.width = 90;
			five.x = 120;
			five.y = 550;
			addChild(five);
			
			//six button
			six = new Button(Assets.ta.getTexture("six"));
			six.addEventListener(Event.TRIGGERED, onSix);
			six.height = 90;
			six.width = 90;
			six.x = 220;
			six.y = 550;
			addChild(six);
			
			//seven button
			seven = new Button(Assets.ta.getTexture("seven"));
			seven.addEventListener(Event.TRIGGERED, onSeven);
			seven.height = 90;
			seven.width = 90;
			seven.x = 320;
			seven.y = 550;
			addChild(seven);
			
			//eight button
			eight = new Button(Assets.ta.getTexture("eight"));
			eight.addEventListener(Event.TRIGGERED, onEight);
			eight.height = 90;
			eight.width = 90;
			eight.x = 420;
			eight.y = 550;
			addChild(eight);
			
			//nine button
			nine = new Button(Assets.ta.getTexture("nine"));
			nine.addEventListener(Event.TRIGGERED, onNine);
			nine.height = 100;
			nine.width = 90;
			nine.x = 520;
			nine.y = 550;
			addChild(nine);
		}
		
		//onZero
		private function onZero(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "0") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onOne
		private function onOne(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "1") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onTwo
		private function onTwo(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "2") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onThree
		private function onThree(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "3") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onFour
		private function onFour(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "4") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onFive
		private function onFive(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "5") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onSix
		private function onSix(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "6") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onSeven
		private function onSeven(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "7") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onEight
		private function onEight(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "8") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
		}
		
		//onNine
		private function onNine(event:Event): void
		{
			var index:int = problems.indexOf(problem);
			if (answers[index] == "9") {
				progress.x += 100;
				if (index < (problems.length-1)) {
					problem = problems[index + 1];
					problem2 = places[index + 1];
					play.visible = false;
					//new question on play button
					play = new Button(Assets.ta.getTexture("buttonpng"), problem2 + "\n" + "\n" + problem);
					play.height = 300;
					play.width = 650;
					play.x = 40;
					play.y = 100;
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
			}
			return
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
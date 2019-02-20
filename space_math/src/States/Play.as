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
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class Play extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var rocket:Player;
		private var play:Button;
		private var place:Button;
		private var single:Button;
		private var buttonText:TextFormat;
		private var problems:Array;
		private var answers:Array;
		private var problem:String;
		
		public function Play(game:Game)
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
			
			rocket = new Player(this);
			addChild(rocket);
			
			//single digits game button
			single = new Button(Assets.ta.getTexture("buttonpng"), "SINGLE DIGITS");
			single.addEventListener(Event.TRIGGERED, singleDigits);
			single.height = 200;
			single.width = 400;
			single.x = 150;
			single.y = 150;
			single.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(single);
			
			//place game button
			place = new Button(Assets.ta.getTexture("buttonpng"), "PLACE GAME");
			place.addEventListener(Event.TRIGGERED, placeGame);
			place.height = 200;
			place.width = 400;
			place.x = 150;
			place.y = 450;
			place.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(place);
			
			var rocketSound:Sound = new Sound();
			rocketSound.load(new URLRequest("Comet.mp3"));
			rocketSound.play();
//			
//			//addition button
//			add = new Button(Assets.ta.getTexture("addition"));
//			add.addEventListener(Event.TRIGGERED, onAdd);
//			add.height = 150;
//			add.width = 150;
//			add.x = 520;
//			add.y = 175;
//			addChild(add);
//			
//			//subtraction button
//			subtract = new Button(Assets.ta.getTexture("subtract"));
//			subtract.addEventListener(Event.TRIGGERED, onSubtract);
//			subtract.height = 150;
//			subtract.width = 150;
//			subtract.x = 520;
//			subtract.y = 375;
//			addChild(subtract);
		}
		
		private function singleDigits(event:Event): void
		{
			game.changeState(Game.SINGLE_DIGITS);
		}
		
		private function placeGame(event:Event): void
		{
			game.changeState(Game.PLACE_GAME);
		}
		
//		private function onAdd(event:Event): void
//		{
//			var index:int = problems.indexOf(problem);
//			if (answers[index] == "+") {
//				progress.x += 100;
//				if (index < (problems.length-1)) {
//					problem = problems[index + 1];
//					play.visible = false;
//					//play button
//					play = new Button(Assets.ta.getTexture("buttonpng"), problem);
//					play.height = 400;
//					play.width = 460;
//					play.x = 40;
//					play.y = 150;
//					play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
//					addChild(play);
//				} else {
//					game.changeState(Game.MENU_STATE);
//				}
//				
//			} else {
//				
//			}
//			return
//		}
//		
//		
//		private function onSubtract(event:Event): void
//		{
//			var index:int = problems.indexOf(problem);
//			if (answers[index] == "-") {
//				progress.x += 100;
//				if (index < (problems.length-1)) {
//					problem = problems[index + 1];
//					play.visible = false;
//					//play button
//					play = new Button(Assets.ta.getTexture("buttonpng"), problem);
//					play.height = 400;
//					play.width = 460;
//					play.x = 40;
//					play.y = 150;
//					play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
//					addChild(play);
//				} else {
//					game.changeState(Game.MENU_STATE);
//				}
//			} else {
//				return
//			}
//		}
		
		public function update():void
		{
			background.update();
			rocket.update();
		}
		
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

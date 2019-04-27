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
	
	public class TestDatabase extends Sprite implements IState
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
		
		public function TestDatabase(game:Game)
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

			//subtraction button
			subtract = new Button(Assets.ta.getTexture("subtract"));
			subtract.addEventListener(Event.TRIGGERED, onSubtract);
			subtract.height = 150;
			subtract.width = 150;
			subtract.x = 520;
			subtract.y = 375;
			addChild(subtract);
		}
		
		
		
		private function onSubtract(event:Event): void
		{
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
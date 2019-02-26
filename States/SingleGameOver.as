package States
{
	import Core.Assets;
	import Core.Game;
	
	import Interfaces.IState;
	
	import Objects.Background;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	//import 
	
	public class SingleGameOver extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var winner:Button;
		private var score:String;
		private var text:TextField;
		private var message:String;
		
		public function SingleGameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);
			
			var score:int = SingleDigits.getScore();
			
			message = "YOU WIN! \n SCORE: " + String(score) + "%\n \n \n \n"
			
			winner = new Button(Assets.ta.getTexture("winframe"), message);
			winner.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			winner.height = 1000;
			winner.width = 720;
			winner.x = 0;
			winner.y = 50;
			addChild(winner)

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
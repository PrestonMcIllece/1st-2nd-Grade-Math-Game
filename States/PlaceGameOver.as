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
	
	public class PlaceGameOver extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var winner:Button;
		private var score:String;
		private var text:TextField;
		private var message:String;
		
		public function PlaceGameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);
			
			var score: int = PlaceGame.getScore();
			
			message = "YOU WIN! \n SCORE: " + String(score) + "%\n \n \n \n"
			
			winner = new Button(Assets.ta.getTexture("winframe"), message);
			winner.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			//winner.alpha = 0;
			//winner.
			winner.height = 1000;
			winner.width = 720;
			winner.x = 0;
			winner.y = 50;
			addChild(winner)
			
			//			score = new Image(Assets.ta.getTexture("SCORE"));
			//			score.height = 200;
			//			score.width = 350;
			//			score.x = 50;
			//			score.y = 350;
			//			addChild(score)
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
package States
{
	import Interfaces.IState;
	import starling.display.Sprite;
	import starling.events.Event;
	import Core.Game;
	import Core.Assets;
	import Objects.Background;
	import starling.display.Image;
	import starling.display.Button;
	
	public class Menu extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var logo:Image;
		private var play:Button;
		
		public function Menu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);
			
			logo = new Image(Assets.ta.getTexture("logo"));
			logo.width = 550;
			logo.pivotX = (logo.width * 0.5);
			logo.x = 275;
			logo.y = 150;
			addChild(logo);
			
			play = new Button(Assets.ta.getTexture("play"));
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.width = 500;
			play.height = 200;
			play.pivotX = (play.width * 0.5);
			play.x = 350;
			play.y = (logo.y + 150);
			addChild(play);
		}
		
		private function onPlay(event:Event): void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		public function update():void
		{
			background.update();
		}
		
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
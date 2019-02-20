package States
{
	import Interfaces.IState;
	import starling.display.Sprite;
	import starling.events.Event;
	import Core.Game;
	
	public class GameOver extends Sprite implements IState
	{
		private var game:Game;
		
		public function GameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}
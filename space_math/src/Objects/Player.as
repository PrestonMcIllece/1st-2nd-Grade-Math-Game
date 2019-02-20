package Objects
{
	import Core.Assets;
	
	import States.PlaceGame;
	import States.Play;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Player extends Sprite
	{
		private var play:Play;
		private var play2:PlaceGame;
		
		public function Player(play:Play)
		{
			this.play = play;
			
			var img:Image = new Image(Assets.ta.getTexture("rocket"));
			img.width = 125;
			img.height = 50;
			img.pivotX = img.width * 0.5;
			img.pivotY = img.height * 0.5;
			addChild(img);
		}
		
		public function update(): void 
		{
			//Eases the image to the mouse position.
			x += (Starling.current.nativeStage.mouseX - (x)) * 0.3;
			y += (Starling.current.nativeStage.mouseY - (y)) * 0.3;
		}
	}
}

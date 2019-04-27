/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates a "player" the user can control. 
 */


package Objects
{
	import Core.Assets;
	import States.PlaceGame;
	import States.Play;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Mouse extends Sprite
	{
		//INSTANCE VARIABLES
		private var play:Play;
		private var play2:PlaceGame;
		
		/**
		 * Constructor that adds a player object to the game.
		 */
		public function Mouse(play:Play)
		{
			this.play = play;
			
			//Adds an image of a rocket as the player
			var img:Image = new Image(Assets.ta.getTexture("rocket"));
			img.width = 125;
			img.height = 50;
			img.pivotX = img.width * 0.5;
			img.pivotY = img.height * 0.5;
			addChild(img);
		}
		
		/**
		 * Updates the player to follow the users mouse position.
		 */
		public function update(): void 
		{
			x += (Starling.current.nativeStage.mouseX - (x)) * 0.3;
			y += (Starling.current.nativeStage.mouseY - (y)) * 0.3;
		}
	}
}
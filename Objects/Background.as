/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the scrolling background for the game.
 */

package Objects
{
	import Core.Assets;
	import starling.display.Sprite;
	import starling.display.Image;
	
	public class Background extends Sprite
	{
		//INSTANCE VARIABLES
		private var sky1:Image;
		private var sky2:Image;
		private var sky3:Image;
		private var sky4:Image;
		
		/**
		 * Constructor - adds multiple sky images.
		 */
		public function Background()
		{
			sky1 = new Image(Assets.skyTexture);
			addChild(sky1);
			
			sky2 = new Image(Assets.skyTexture);
			sky2.y = -500; //position above sky1
			addChild(sky2);
			
			sky3 = new Image(Assets.skyTexture);
			sky3.y = -1000; //position above sky2
			addChild(sky3);
			
			sky4 = new Image(Assets.skyTexture);
			sky4.y = +500; //position above sky2
			addChild(sky4);
			
		}
		
		/**
		 * Moves the sky down the screen. If off the screen, moves back to top.
		 */
		public function update():void
		{
			sky1.y += 1;
			//If off screen, move back to top.
			if(sky1.y >= 1000)
				sky1.y = -1000;
			sky2.y += 1;
			if(sky2.y >= 1000)
				sky2.y = -1000;
			sky3.y += 1;
			if(sky3.y >= 1000)
				sky3.y = -1000;
			sky4.y += 1;
			if(sky4.y >= 1000)
				sky4.y = -1000;
		}
	}
}
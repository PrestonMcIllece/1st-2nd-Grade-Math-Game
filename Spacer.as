/**
 * Main default class that runs when we run the game.
 * Launches the Starling instance.
 */
package Core
{
	import flash.display.Sprite;
	import starling.core.Starling;
	
	//Swift metadata.
	[SWF(width=1000, height=800, frameRate=60), backgroundColor=0x000000]
	
	public class Spacer extends Sprite
	{
		
		public function Spacer()
		{
			//Create instance of Starling class.
			var star:Starling = new Starling(Game, stage);
			//Stats for the game -- turn off later.
			star.showStats = false;
			star.start();
		}
	} 
}
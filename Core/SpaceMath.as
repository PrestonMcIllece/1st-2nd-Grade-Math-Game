/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Main default class that runs when we run the game.
 * Launches the Starling instance.
 */

package Core
{
	import com.gamua.flox;
	import com.gamua.flox.Flox;
	import com.gamua.flox.Player;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import Objects.MyPlayer;
	import starling.core.Starling;
	
	//Information from Flox.cc to connect the game to the Flox server.
	Flox.init("SjfmtS1ejWJfO5o5", "ElLACyQzQlrsHGbN", "0.9");
	
	//Swift metadata.
	[SWF(width=1000, height=800, frameRate=60), backgroundColor=0x000000]
	
	public class SpaceMath extends Sprite
	{
		//INSTANCE VARIABLES
		public var flashVars:Object = LoaderInfo(this.root.loaderInfo).parameters;
		public var fname:String = flashVars.fName;
		public var lname:String = flashVars.lName;
		public var player:MyPlayer;
		
		//CONSTRUCTOR
		public function SpaceMath()
		{

			var star:Starling = new Starling(Game, stage);//Create instance of Starling class.
			star.showStats = false; //Stats for the game -- turn off later.
			star.start();
			
			var name:String = fname + lname;
			var myname:String = "rachelluker";
			
			Player.loginWithKey(name, function onComplete(player:Player) {
				//Logged in!
				trace(name + " logged in!");
			},
				function onError(message:String) {
					//Not working!
				}
			);
			
			//MyPlayer.setName(this.fname, this.lname);
			MyPlayer.fname = fname;
			MyPlayer.lname = lname;
//			player.fname = "RACHEL";
//			player.lname = "LUKER";
			
		}
		
		public function getVars(): String {
			return fname + lname
		}
	} 
}

//BELOW IS INFORMATION FROM THE FLOX WEBSITE
/**
 //Submit log entries
 Flox.logInfo("Player {0} lost a life.", player);
 Flox.logWarning("Something fishy is going on!");
 Flox.logError(error);
 And finally, if you want to chart custom events, use this:
 
 //Submit custom event
 Flox.logEvent("GameStarted");
 
 //Submit custom event with properties
 Flox.logEvent("MenuChanged", { from: "MainMenu", to: "SettingsMenu" });
 
 * //Who's currently playing?
 var currentPlayer:Player = Player.current;
 **/
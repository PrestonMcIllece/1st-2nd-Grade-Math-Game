package Objects
{
	import com.gamua.flox.Flox;
	import com.gamua.flox.Player;
	
	public class MyPlayer 
	{
		public static var fname:String;
		public static var lname:String;
		public static var single:Boolean;
		public static var place:Boolean;
		public static var double:Boolean;
		
		public function MyPlayer()
		{

		}
		
		public static function setName(fname2:String, lname2:String): void {
			fname = fname2;
			lname = lname2;
		}
		
		public static function getfname(): String {
			return fname
		}
		
		public static function getlname(): String {
			return lname
		}
	}
}
/**
 * Used to imbed and manage the various assets we have in our game.
 */
package Core
{
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		//Using ../ takes you back to the parent folder.
		[Embed(source='../../assets/night-sky.png')]
		private static var sky:Class;
		//Texture that we can reference out of this class.
		public static var skyTexture:Texture;
		
		[Embed(source='../../assets/atlas.png')]
		private static var atlas:Class;
		
		public static var ta:TextureAtlas;
		
		[Embed(source='../../assets/atlas.xml', mimeType='application/octet-stream')]
		private static var atlasXML:Class;
		
		//"PT Sans Caption"
		[Embed(source='../../assets/myFont.png')]
		private static var myFont:Class;
		
		[Embed(source='../../assets/myFont.fnt', mimeType='application/octet-stream')]
		private static var myFontXML:Class;
		
		public static function init():void
		{
			//The skyTexture is only loaded into memory one time.
			skyTexture = Texture.fromBitmap(new sky());
			
			ta = new TextureAtlas(Texture.fromBitmap(new atlas()), 
				XML(new atlasXML()));
		
			TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new myFont()), XML(new myFontXML())));
			//TextField.registerCompositor(BitmapFont(Texture.fromBitmap(new myFont())), "PT Sans Caption");
			//TextField.registerCompositor(new BitmapFont(Texture.fromBitmap(new myFont()), XML(new myFontXML())));
			
		}
	}
}

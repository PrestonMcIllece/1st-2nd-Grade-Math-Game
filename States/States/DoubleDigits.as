/**
 * SPACEMATH - AUTHORS: 404 NOT FOUND
 * Class that generates the double digits game.
 */

package States
{
	//flash imports
	import flash.media.Sound;
	import flash.net.URLRequest;
	import Core.Assets;
	import Core.Game;
	import Interfaces.IState;
	import Objects.Background;
	import Objects.Mouse;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	public class DoubleDigits extends Sprite implements IState
	{
		//instance variables
		private var game:Game;
		private var background:Background;
		private var rocket:Mouse;
		private var play:Button;
		private var zero:Button;
		private var one:Button;
		private var two:Button;
		private var three:Button;
		private var four:Button;
		private var five:Button;
		private var six:Button;
		private var seven:Button;
		private var eight:Button;
		private var nine:Button;
		private var ten:Button;
		private var eleven:Button;
		private var progress:Button;
		private var buttonText:TextFormat;
		private var problems:Array; //array used for problem set
		private var answers:Array; //array used for problem set
		private var remove:Array;
		private var problem:String;
		private var problem2:String;
		private var hundreds:String;
		private var tens:String;
		private var ones:String;
		public static var correctCount:int = 0;
		public static var incorrectCount:int = 0;
		private var probNum:int = 0;
		private var countProbs:int = 0;
		private var count:int = 0;
		private var planet:DisplayObject;
		private var updateCount:int = 0;
		
		/**
		 * Constructor - generates problems, calls the init function. 
		 */
		public function DoubleDigits(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			problems = []; //initialize problem set
			answers = []; //intialize answers set 
			remove = []; //problems already used
			getProblemSet();
			
			probNum = randomRange(0, (problems.length-1));
			problem  = problems[probNum];
		}
		
		/**
		 * Function that initializes the game question, answer, and progress buttons.
		 */
		private function init(event:Event):void
		{
			
			background = new Background();
			addChild(background);
			
			correctCount = problems.length;
			incorrectCount = 0;
			
			//progress planet
			planet = new Button(Assets.ta.getTexture("planetpng"));
			planet.height = 125;
			planet.width = 200;
			planet.x = background.width - 150;
			planet.y = 620;
			addChild(planet);
			
			//progress rocket
			progress = new Button(Assets.ta.getTexture("rocket"));
			progress.height = 90;
			progress.width = 90;
			progress.x = -20;
			progress.y = 670;
			addChild(progress);
			
			//question button
			//play = new Button(Assets.ta.getTexture("buttonpng"), "Problems coming soon!");
			play = new Button(Assets.ta.getTexture("buttonpng"), String(problem));
			play.addEventListener(Event.TRIGGERED, sendHome);
			play.height = 300;
			play.width = 650;
			play.x = 40;
			play.y = 100;
			play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(play);
			
			//zero button
			zero = new Button(Assets.ta.getTexture("buttonpng"), String(answers[0]));
			zero.addEventListener(Event.TRIGGERED, onZero);
			zero.height = 90;
			zero.width = 90;
			zero.x = 120;
			zero.y = 450;
			zero.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(zero);
			
			//one button
			one = new Button(Assets.ta.getTexture("buttonpng"), String(answers[1]));
			one.addEventListener(Event.TRIGGERED, onOne);
			one.height = 90;
			one.width = 90;
			one.x = 220;
			one.y = 450;
			one.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(one);
			
			//two button
			two = new Button(Assets.ta.getTexture("buttonpng"), String(answers[2]));
			two.addEventListener(Event.TRIGGERED, onTwo);
			two.height = 90;
			two.width = 90;
			two.x = 320;
			two.y = 450;
			two.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(two);
			
			//three button
			three = new Button(Assets.ta.getTexture("buttonpng"), String(answers[3]));
			three.addEventListener(Event.TRIGGERED, onThree);
			three.height = 90;
			three.width = 90;
			three.x = 420;
			three.y = 450;
			three.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(three);
			
			//four button
			four = new Button(Assets.ta.getTexture("buttonpng"), String(answers[4]));
			four.addEventListener(Event.TRIGGERED, onFour);
			four.height = 90;
			four.width = 90;
			four.x = 520;
			four.y = 450;
			four.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(four);
			
			//five button
			five = new Button(Assets.ta.getTexture("buttonpng"), String(answers[5]));
			five.addEventListener(Event.TRIGGERED, onFive);
			five.height = 90;
			five.width = 90;
			five.x = 120;
			five.y = 550;
			five.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(five);
			
			//six button
			six = new Button(Assets.ta.getTexture("buttonpng"), String(answers[6]));
			six.addEventListener(Event.TRIGGERED, onSix);
			six.height = 90;
			six.width = 90;
			six.x = 220;
			six.y = 550;
			six.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(six);
			
			//seven button
			seven = new Button(Assets.ta.getTexture("buttonpng"), String(answers[7]));
			seven.addEventListener(Event.TRIGGERED, onSeven);
			seven.height = 90;
			seven.width = 90;
			seven.x = 320;
			seven.y = 550;
			seven.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(seven);
			
			//eight button
			eight = new Button(Assets.ta.getTexture("buttonpng"), String(answers[8]));
			eight.addEventListener(Event.TRIGGERED, onEight);
			eight.height = 90;
			eight.width = 90;
			eight.x = 420;
			eight.y = 550;
			eight.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(eight);
			
			//nine button
			nine = new Button(Assets.ta.getTexture("buttonpng"), String(answers[9]));
			nine.addEventListener(Event.TRIGGERED, onNine);
			nine.height = 90;
			nine.width = 90;
			nine.x = 520;
			nine.y = 550;
			nine.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
			addChild(nine);
		}
		
		//onZero
		private function onZero(event:Event): void
		{
			if (answers[0] == answers[probNum]) {
				correctAns();
				zero.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onOne
		private function onOne(event:Event): void
		{
			if (answers[1] == answers[probNum]) {
				correctAns();
				one.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onTwo
		private function onTwo(event:Event): void
		{
			if (answers[2] == answers[probNum]) {
				correctAns();
				two.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onThree
		private function onThree(event:Event): void
		{
			if (answers[3] == answers[probNum]) {
				correctAns();
				three.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onFour
		private function onFour(event:Event): void
		{
			if (answers[4] == answers[probNum]) {
				correctAns();
				four.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onFive
		private function onFive(event:Event): void
		{
			
			if (answers[5] == answers[probNum]) {
				correctAns();
				five.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		//onSix
		private function onSix(event:Event): void
		{
			if (answers[6] == answers[probNum]) {
				correctAns();
				six.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onSeven
		private function onSeven(event:Event): void
		{
			if (answers[7] == answers[probNum]) {
				correctAns();
				seven.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onEight
		private function onEight(event:Event): void
		{
			if (answers[8] == answers[probNum]) {
				correctAns();
				eight.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		//onNine
		private function onNine(event:Event): void
		{
			if (answers[9] == answers[probNum]) {
				correctAns();
				nine.visible = false;
			} else { //incorrect answer
				incorrectAns();
			}
		}
		
		/**
		 * Method that generates the problem and answer sets for the game.
		 */
		public function getProblemSet(): void {
			var firstNum:Array = [];
			var secNum:Array = [];
			var check1:int = 0;
			var check2:int = 0;
			
			for(var i:int = 0; i < 10; i++) { //change i < #, to change # of problems in set
				var first:int = randomRange(10,99);
				firstNum[i] = first;
				var second:int = randomRange(1,9);
				secNum[i] = second;
				
				check1 = firstNum[i] - secNum[i];
				check2 = firstNum[i] + secNum[i];
				
				//while there is already a problem with that answer, produce a new second number
				while (answers.indexOf(check1) != -1 && answers.indexOf(check2) != -1) {
					second = randomRange(1,9);
				}
				
				if (problems.length % 2 == 0) { //subtract them
					answers[i] = firstNum[i] - secNum[i];
					problems[i] = String(firstNum[i]) + " - " + String(secNum[i]) + " = ? ";
					
				} else { //add them, move largest number first
					answers[i] = firstNum[i] + secNum[i];
					problems[i] = String(firstNum[i]) + " + " + String(secNum[i]) + " = ? ";
				}
				
			}
			
			//fill the remove array with problems numbers 0 thru (problems array length - 1)
			remove = [];
			for (var x:int = 0; x < problems.length; x++) {
				remove[x] = x;
			}
			
		}
		
		/**
		 * Function called on a correct answer.
		 */
		public function correctAns(): void {
			//correctCount++;
			count = 0;
			countProbs++;
			//remove.push(probNum);
			remove[probNum] = 100;
			progress.x += (background.width/problems.length) - 15;
			if (countProbs < problems.length) { //still problems left
				probNum = randomRange(0, (problems.length - 1));
				while(remove.indexOf(probNum) == -1) { //if problem num not in remove (already chosen)
					probNum = randomRange(0, (problems.length - 1)); //choose new problem
				}
				problem = problems[probNum];
				play.visible = false;
				//new question on play button
				play = new Button(Assets.ta.getTexture("buttonpng"), String(problem));
				play.addEventListener(Event.TRIGGERED, sendHome);
				play.height = 300;
				play.width = 650;
				play.x = 40;
				play.y = 100;
				play.textFormat.setTo("PT Sans Caption", 80, 0xffffff);
				addChild(play);
				var yesSound:Sound = new Sound();
				yesSound.load(new URLRequest("simpsons_yes_man.mp3"));
				yesSound.play();
			} else {
				progress.visible = false;
				var clap:Sound = new Sound();
				clap.load(new URLRequest("clap.mp3"));
				clap.play();
				game.changeState(Game.DOUBLE_GAME_OVER);
			}
		}
		
		/**
		 * Function called on an incorrect answer.
		 */
		public function incorrectAns(): void {
			if (count == 0) { //first incorrect answer for the problem
				incorrectCount++;
			}
			count++;
			var noSound:Sound = new Sound();
			noSound.load(new URLRequest("patrick_no.mp3"));
			noSound.play();
			if (count == 2) { //second incorrect answer, show the answer
				incorrectCount++;
				var str:String;
				var ques:int = problem.indexOf("?");
				var beg:String = problem.substring(0,ques);
				var end:String = String(answers[probNum]);
				var prob:String = beg + end;				
				//str = "The correct answer is: " + answers[index] + "\n\n" + problem;
				str = "The correct answer is: " + answers[probNum] + "\n" + prob;
				play = new Button(Assets.ta.getTexture("buttonpng"), str);
				play.height = 300;
				play.width = 650;
				play.x = 40;
				play.y = 100;
				play.textFormat.setTo("PT Sans Caption", 70, 0xffffff);
				addChild(play);
			}
		}
		
		/**
		 * Returns a number within the specified range, helper method for the getProblemSet(). 
		 */
		private function randomRange(minNum:Number, maxNum:Number):int  {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		/**
		 * Functions that gets the player's final score (percent accurate).
		 */
		public static function getScore(): Number
		{
			var score:Number = correctCount - (0.5 * incorrectCount); //problems[] array length - 0.5 per incorrect click
			score = score * 10;
			return score
		}
		
		/**
		 * Sends player back to home screen.
		 */
		public function sendHome(): void {
			game.changeState(Game.PLAY_STATE);
			correctCount = 0;
			incorrectCount = 0;
		}
		
		/**
		 * Updates the scrolling star background.
		 */
		public function update():void
		{
			background.update();
			
			updateCount++;
			
			if (updateCount % 15 == 0 && updateCount % 30 == 0) {
				progress.x += 0.75;
				progress.y += 1.0;
			} else if (updateCount % 15 == 0) {
				//progress.x -= 1.0;
				progress.y -= 1.0;
			}
			
			if (updateCount % 50 == 0 && updateCount % 100 == 0) {
				planet.x += 2.5;
				planet.y += 2.5;
			} else if (updateCount % 50 == 0) {
				planet.x -= 2.5;
				planet.y -= 2.5;
			}
		}
		
		/**
		 * Destroys the background and elements.
		 */
		public function destroy():void
		{
		}
		
	}
}

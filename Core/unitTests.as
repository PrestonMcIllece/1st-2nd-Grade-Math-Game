package Core 
{
	import Interfaces.IState;
	import States.SingleDigits;
	import starling.display.Sprite;
	
	public class unitTests extends Sprite implements IState
	{
		private var single:SingleDigits;
		
		public function unitTests()
		{
			var negative:int = 0;
			for(var i:int = 0; i < 100; i++) {
				single.getProblemSet();
				var problems:Array = single.problems;
				var answers:Array = single.answers;
				
				for(var x:int = 0; x < answers.length; x++) {
					if(answers[x] < 0) {
						negative++;
					}
				}
		
			}
			
			if(negative != 0) {
				trace("Failed - produced a negative");
			} else {
				trace("No Negatives Passes!");
			}
			
			
		}
		
		public function update(): void {
		}
		
		public function destroy(): void {
		}
		
	}
}
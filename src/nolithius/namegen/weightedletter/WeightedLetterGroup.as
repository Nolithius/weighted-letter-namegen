package nolithius.namegen.weightedletter
{
	import flash.utils.Dictionary;
	
	
	/**
	 * Weighted Letter Group. Used to store the next letters after a given letter.
	 * @author Ebyan Alvarez-Buylla
	 */
	public class WeightedLetterGroup
	{
		public var letters:Dictionary = new Dictionary();
		public var letterSamples:Array = new Array();
		
		
		public function add(letter:String):void
		{
			if (!letters[letter])
			{
				letters[letter] = new WeightedLetterCounter(letter);
			}
			
			letters[letter].count++;
		}
		
		
		/**
		 * Expand the letters dictionary into an array, for ease of picking letters
		 * in the main body loop. We still keep the letters data for more easily
		 * finding a best-fit.
		 */
		public function expandSamples():void
		{
			for each(var letter:WeightedLetterCounter in letters)
			{
				for(var i = 0; i < letter.count; i++)
				{
					letterSamples.push(letter.letter);
				}
			}
		}
	}
}
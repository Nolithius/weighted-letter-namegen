package nolithius.namegen.weightedletter
{
	import flash.utils.Dictionary;
	
	
	/**
	 * WeightedLetter. Holds the letter distribution information.
	 * @author Ebyan Alvarez-Buylla
	 */
	public class WeightedLetter
	{
		public var letter:String;
		public var nextLetters:WeightedLetterGroup = new WeightedLetterGroup();
		
		
		public function WeightedLetter(p_letter:String)
		{
			letter = p_letter;
		}
		
		
		/**
		 * Have the WeightedLetterGroup keep track of the next letter instead of a simple
		 * array. A simple array will do the trick (removing the need for WightedLetterGroup
		 * or WeightedLetterCounter), if you use a different algorithm for best-fitting
		 * the penultimate letter (see WeightedLetterNamegen.getIntermediateLetter()).
		 * @param	nextLetter
		 */
		public function addNextLetter(nextLetter:String):void
		{
			nextLetters.add(nextLetter);
		}
	}
}
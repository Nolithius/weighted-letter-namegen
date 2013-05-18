package nolithius.namegen.weightedletter 
{
	/**
	 * Weighted Letter Counter. Adds counting functionality to a letter.
	 * @author Ebyan Alvarez-Buylla
	 */
	public class WeightedLetterCounter
	{
		var letter:String;
		var count:uint = 0;
		
		
		public function WeightedLetterCounter(p_letter:String) 
		{
			letter = p_letter;
		}
	}
}
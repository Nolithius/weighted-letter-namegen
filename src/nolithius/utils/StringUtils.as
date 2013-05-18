package nolithius.utils
{
	public class StringUtils
	{
		public static function trim(string:String):String
		{
			return string.replace(/^\s+|\s+$/g, '');
		}
		

		public static function ucfirst(string:String):String
		{
			return string.substring(0, 1).toUpperCase() + string.substring(1);
		}
		

		/**
		 * Computes the Levenshtein distance between two words.
		 * Implemented from algorithm found in http://en.wikipedia.org/wiki/Levenshtein_distance
		 * @param	word1	The first word to compare.
		 * @param	word2	The second word to compare.
		 * @return	The Levenshtein distance between the two words.
		 */
		public static function levenshtein(word1:String, word2:String):uint
		{
			var levenshteinMatrix:Array = new Array();
			
			// Split to arrays for faster access
			var word1Array:Array = word1.split("");
			var word2Array:Array = word2.split("");
			
			// Initialize sizes
			var word1Length:uint = word1Array.length;
			var word2Length:uint = word2Array.length;
			
			// Generate 2D array
			for (var i:uint = 0; i <= word1Length; i++)
			{
				levenshteinMatrix.push(new Array(word2Length+1));
			}
			
			// Initial values for word1
			for (var i_m:uint = 0; i_m <= word1Length; i_m++)
			{
				levenshteinMatrix[i_m][0] = i_m;
			}
			
			// Initial values for word2
			for (var i_n:uint = 0; i_n <= word2Length; i_n++)
			{
				levenshteinMatrix[0][i_n] = i_n;
			}
			
			for (i_m = 1; i_m <= word1Length; i_m++)
			{
				for (i_n = 1; i_n <= word2Length; i_n++)
				{
					// The same
					if (word1Array[i_m-1] == word2Array[i_n-1])
					{
						levenshteinMatrix[i_m][i_n] = levenshteinMatrix[i_m - 1][i_n - 1];
					}
					// Different values
					else
					{
						levenshteinMatrix[i_m][i_n] = Math.min
						(
							levenshteinMatrix[i_m-1][i_n] + 1, // Deletion
							levenshteinMatrix[i_m][i_n-1] + 1, // Insertion
							levenshteinMatrix[i_m-1][i_n-1] + 1 // Removal
						);
					}
				}
			}
						
			// Return the shortest path, defined by levenshteinMatrix[word1Length][word2Length];
			return levenshteinMatrix[word1Length][word2Length];
		}
		
		
		/**
		 * Computes the Damerau-Levenshtein distance between two words.
		 * The Damerau-Levenshtein distance is the same as the Levenshtein distance, except it counts transposition of adjacent letters, as 1. For example,
		 * the Levenshtein distance of "time" vs. "tiem" is 2, but the Damerau-Levenshtein distance is 1, since only one operation occurred: transposition.
		 * Implemented from algorithm found in http://en.wikipedia.org/wiki/Damerau-Levenshtein_distance
		 * @param	word1	The first word to compare.
		 * @param	word2	The second word to compare.
		 * @return	The Damerau-Levenshtein distance between the two words.
		 */
		public static function damerau(word1:String, word2:String):uint
		{
			var levenshteinMatrix:Array = new Array();
			
			// Split to arrays for faster access
			var word1Array:Array = word1.split("");
			var word2Array:Array = word2.split("");
			
			// Initialize sizes
			var word1Length:uint = word1Array.length;
			var word2Length:uint = word2Array.length;
			
			// Generate 2D array
			for (var i:uint = 0; i <= word1Length; i++)
			{
				levenshteinMatrix.push(new Array(word2Length+1));
			}
			
			// Initial values for word1
			for (var i_m:uint = 0; i_m <= word1Length; i_m++)
			{
				levenshteinMatrix[i_m][0] = i_m;
			}
			
			// Initial values for word2
			for (var i_n:uint = 0; i_n <= word2Length; i_n++)
			{
				levenshteinMatrix[0][i_n] = i_n;
			}
						
			for (i_m = 1; i_m <= word1Length; i_m++)
			{
				for (i_n = 1; i_n <= word2Length; i_n++)
				{
					var cost:uint = 1;
					
					// The same, zero cost
					if (word1Array[i_m-1] == word2Array[i_n-1])
					{
						cost = 0;
					}

					levenshteinMatrix[i_m][i_n] = Math.min
					(
						levenshteinMatrix[i_m-1][i_n] + 1, // Deletion
						levenshteinMatrix[i_m][i_n-1] + 1, // Insertion
						levenshteinMatrix[i_m-1][i_n-1] + cost // Removal
					);
					
					// Test for transposition
					if (i_m > 1 && i_n > 1 && word1Array[i_m - 1] == word2Array[i_n - 2] && word1Array[i_m - 2] == word2Array[i_n - 1])
					{
						levenshteinMatrix[i_m][i_n] = Math.min
						(
							levenshteinMatrix[i_m][i_n],
							levenshteinMatrix[i_m-2][i_n-2] + cost // Transposition
						);
					}
				}
			}
			
			// Return the shortest path, defined by levenshteinMatrix[word1Length][word2Length];
			return levenshteinMatrix[word1Length][word2Length];
		}
	}
}
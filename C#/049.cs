using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem049 : IProblem
	{

		public void CalculateSolution()
		{
			//Properties:
			//(1) All prime
 			//(2) Increasing by 3330
			//(3) Permutations of each other

			var primes = Helper.Methods.GetPrimes((int)1E4)
			                   .SkipWhile(p => p < 1E3)
			                   .ToArray();

			var filteredPrimes = primes.Select(p => Helper.Methods.GetAllDigits(p)									//Take the digits
			                                              .Permutations()											//Permutate
			                                              .Select(perm => (int)Helper.Methods.DigitsToNumber(perm)) //Convert back to number
			                                              .Where(n => n >= 1E3)										//Only take 4-digit nums (if zero is in beginning, bad)
			                                              .Where(primes.Contains)									//Only take primes
			                                              .Distinct()												//Remove double entries (come up if any digit is doubled)
			                                              .ToArray())
			                           .Select(perms => perms.ToList()
			                                                 .Where(perm => (new[] {0, 3330, 6660}).Contains(perm - perms[0])) //Select only primes, which are 0, 3330 or 6660 units above the original
			                                                 .ToArray())
			                           .Where(perm => perm.Count() == 3)											//Only take 3-entries results
			                           .ToArray();

			var resnumbers = filteredPrimes.Select(seq => seq.Select(n => n.ToString())
			                                                .Aggregate((curr, next) => curr + next));
			this.Solution = resnumbers.ToArray()[1];
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

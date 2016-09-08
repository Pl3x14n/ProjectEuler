using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem041 : IProblem
	{

		public void CalculateSolution()
		{
			//Actually 9- and 8-digits can be pandigital as well, 
			//but the sum of the digits of every 9-digit pandigital is 45 (divisible by 3),
			//and the sum of the digits of every 8-digit pandigital is 36 (divisble by 3) 
			for (var digits = 7; ; digits--)
			{

				var possnums = Enumerable.Range(1, digits)
										 .Permutations();
				var possprimes = possnums.Where(nums => new[] { 1, 3, 7, 9 }.Contains(nums.Last()));
				var primes = possprimes.Select(pp => (int)Helper.Methods.DigitsToNumber(pp))
									   .Where(Helper.Methods.IsPrime)
									   .ToArray();

				if (!primes.Any())
					continue;

				this.Solution = primes.Max()
									  .ToString();
				break;
			}
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

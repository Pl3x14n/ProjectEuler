using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem010 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = (int)2E6;

			var primes = Helper.Methods.GetPrimes(limit);
			Solution = primes.Select(p => (long)p).Sum().ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

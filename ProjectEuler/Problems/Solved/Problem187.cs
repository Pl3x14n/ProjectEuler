using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem187 : IProblem
	{

		public void CalculateSolution()
		{
			var maxn = (int)1E8;
			var primes = Methods.GetPrimes2(maxn / 2);

			var sum = 0;
			for (var i = 0; i < primes.Length; i++)
			{
				if (primes[i] > Math.Sqrt(maxn) + 1)
					break;

				sum += primes.Skip(i).TakeWhile(p => primes[i] * p < maxn).Count();
			}

			Solution = sum.ToString();
		}

		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

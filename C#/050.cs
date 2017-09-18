using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using System.Diagnostics;

	class Problem050 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = (int)1E6;
			var primes = Helper.Methods.GetPrimes(limit);
			var maxtermlength = 1;
			var maxtermprime = 1;

			for (var i = 0; i < primes.Length; i++)
			{
				var sum = primes[i];
				var counter = maxtermlength;

				for (var j = i + 1; j < i + counter; j++)
					sum += primes[j];

				if (sum > limit)
					break;

				while (sum < limit)
				{
					sum += primes[i + counter];

					counter++;
					if (!primes.Contains(sum) || counter <= maxtermlength)
						continue;

					maxtermlength = counter;
					maxtermprime = sum;
					//Console.WriteLine("Prime: " + sum + "\t Termlength: " + maxtermlength);
				}
			}

			this.Solution = maxtermprime.ToString();
			this.Hint = maxtermlength + " terms";
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

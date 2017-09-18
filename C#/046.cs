using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem046 : IProblem
	{

		public void CalculateSolution()
		{
			var primes = new List<int> {2, 3, 5, 7};
			int n;
			for (n = 9;; n += 2)
			{
				if (Helper.Methods.IsPrime(n))
				{
					primes.Add(n);
					continue;
				}

				var possible = primes.Select(p => Math.Sqrt((n - p) * 0.5))	//select the square number
				                     .Any(s => s % 1 < Helper.Methods.Epsilon);

				if (!possible)
					break;
			}

			this.Solution = n.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

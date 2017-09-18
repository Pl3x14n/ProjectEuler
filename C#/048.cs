using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using System.Numerics;

	class Problem048 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 1000;

			var sol = Enumerable.Range(1, limit)
			                    .Select(n => BigInteger.ModPow(n, n, new BigInteger(1E10)))
			                    .Aggregate((curr, next) => curr + next);

			this.Solution = (sol % new BigInteger(1E10)).ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using System.Collections;

	class Problem047 : IProblem
	{

		public void CalculateSolution()
		{
			const int consecutive = 4;
			const int primefacts = 4;
			var firstprimes = new[] {2, 3, 5, 7, 11, 13};

			var lastpfcount = Enumerable.Repeat(0, consecutive)
			                            .ToArray();	//Saves the count of primefactors
			Enumerable.Range(2, consecutive - 1)
			          .ToList()
			          .ForEach(i => lastpfcount[i - 1] = (Helper.Methods.GetPrimeFactors(i)
			                                                    .Count()));
			int n;
			for (n = firstprimes.Take(consecutive)
			                    .Aggregate((curr, next) => curr * next);; n++)
			{
				for (var index = 0; index <= consecutive - 2; index++)
					lastpfcount[index] = lastpfcount[index + 1];

				lastpfcount[consecutive - 1] = Helper.Methods.GetPrimeFactors(n).Count();

				if (lastpfcount.All(lpfc => lpfc == primefacts))
					break;

			}

			this.Solution = (n - consecutive + 1).ToString();
		}



		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

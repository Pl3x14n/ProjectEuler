using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem023 : IProblem
	{

		public void CalculateSolution()
		{
			var abundants = new List<int>();

			Enumerable.Range(1, 28122)
			          .ToList()
			          .Where(n => (Helper.Methods.GetFactors(n)
			                             .Sum() - n) > n)
			          .ToList()
			          .ForEach(abundants.Add); 

			var abundantsums = (from a1 in abundants
								from a2 in abundants
								select a1 + a2).ToList();

			abundantsums.Distinct().ToList().Sort();

			var result = Enumerable.Range(1, 28122).ToList().Except(abundantsums);

			this.Solution = result.Sum()
			                      .ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

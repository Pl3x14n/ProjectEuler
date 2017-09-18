using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem028 : IProblem
	{

		public void CalculateSolution()
		{
			const int size = 1001;

			var sum = 1;
			var lastmax = 1;

			for (var step = 2; step <= size; step += 2)
			{
				//1 
				//+ (1 + 2) + (1 + 2 + 2) + (1 + 2 + 2 + 2) + (1 + 2 + 2 + 2 + 2)		-- first ring
				//+ (9 + 4) + (9 + 4 + 4) + (9 + 4 + 4 + 4) + (9 + 4 + 4 + 4 + 4)       -- second ring
				//+ ...
				// 10 times (2) or (4) (step) and 4 times (1) / (9) (lastmax)

				sum += 4 * lastmax + 10 * step;
				lastmax += 4 * step;
			}


			this.Solution = sum.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

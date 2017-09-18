using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem053 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 100;
			var count = 0;

			var combs = new int[101, 101];
			for (var n = 0; n <= limit; n++)
			{
				combs[n, 0] = 1;
				combs[n, n] = 1;
			}

			for (var n = 0; n <= limit; n++)
			{
				for (var r = 1; r < n; r++)
				{
					var sum = combs[n - 1, r - 1] + combs[n - 1, r];

					if (sum > 1E6)
					{
						sum = (int)1E6;
						count++;
					}
					combs[n, r] = sum;
				}
			}


			this.Solution = count.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

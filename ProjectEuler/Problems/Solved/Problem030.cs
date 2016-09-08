using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem030 : IProblem
	{

		public void CalculateSolution()
		{
			const int exp = 5;
			var limit = 6 * (int)Math.Pow(9, 5);

			var pows = Enumerable.Range(0, 10).Select(n => Math.Pow(n, exp)).ToArray();
			Func<int, int> score = (n => (int)Helper.Methods.GetAllDigits(n).Select(d => pows[d]).Sum());


			var sols = new List<int>();
			for (var n = 2; n <= limit;  n++)
				if (score(n) == n)
					sols.Add(n);

			this.Solution = sols.Sum().ToString();
			this.Hint = "{" + string.Join(", ", sols) + "}";
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

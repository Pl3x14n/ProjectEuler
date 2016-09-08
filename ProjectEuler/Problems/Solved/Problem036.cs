using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem036: IProblem
	{

		public void CalculateSolution()
		{
			const int limit = (int)1E6;
			var sol = (from n in Enumerable.Range(1, limit - 1)
			           where Helper.Methods.IsPalindromic(n.ToString())
			           let b = Convert.ToString(n, 2)
			           where Helper.Methods.IsPalindromic(b)
			           select n).ToArray();

			this.Solution = sol.Sum().ToString();
			this.Hint = string.Join(", ", sol);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

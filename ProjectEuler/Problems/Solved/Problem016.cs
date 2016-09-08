using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Numerics;

namespace ProjectEuler.Problems
{
	class Problem016 : IProblem
	{

		public void CalculateSolution()
		{
			const int power = 1000;

			var exp = new BigInteger(1) << power;
			var sol = exp.ToString()
			             .ToList()
			             .Select(c => int.Parse(c.ToString()))
			             .Sum();

			this.Solution = sol.ToString();
			this.Hint = "2 ** " + power + " = " + (double)exp;
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

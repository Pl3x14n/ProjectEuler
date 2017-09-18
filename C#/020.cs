using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem020 : IProblem
	{

		public void CalculateSolution()
		{
			const int b = 100;

			var n = Helper.Methods.Factorial(b);
			var digits = n.ToString()
						  .Select(c => int.Parse(c.ToString()));
			var sum = digits.Sum();

			this.Solution = sum.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

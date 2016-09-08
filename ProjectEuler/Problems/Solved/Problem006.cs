using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem006 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 100;
			var sumofsquares = Enumerable.Range(1, limit)
			                             .Aggregate((current, n) => current + n * n);
			var squareofsum = Math.Pow(Helper.Methods.GetTriangleNumber(limit), 2);

			var dif = squareofsum - sumofsquares;

			this.Solution = dif.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }
	}
}

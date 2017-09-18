using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem002 : IProblem
	{

		public void CalculateSolution()
		{
			var fibseq = Helper.Methods.GetFibonacciSequence((int)4E6).Skip(1); //First 1 has to be skipped
			var sol = fibseq.Where(f => f % 2 == 0).Sum();

			this.Solution = sol.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

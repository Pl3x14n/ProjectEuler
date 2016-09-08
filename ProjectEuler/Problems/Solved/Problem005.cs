using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem005 : IProblem
	{

		public void CalculateSolution()
		{
			const int factorlimit = 20;

			var sol = Enumerable.Range(1, factorlimit).Select(n => (long)n)
			                    .Aggregate(Helper.Methods.LCM);

			Solution = sol.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }
	}
}

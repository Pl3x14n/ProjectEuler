using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem029 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 100;
			var powers = new List<double>();

			for(var a = 2; a <= limit; a++)
				for (var b = 2; b <= limit; b++)
					powers.Add(Math.Pow(a, b));

			powers = powers.Distinct().ToList();

			this.Solution = powers.Count.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

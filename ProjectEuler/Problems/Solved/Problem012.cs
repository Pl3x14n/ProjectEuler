using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem012 : IProblem
	{

		public void CalculateSolution()
		{
			const int mindivs = 500;

			var n = 1;
			while (true)
			{
				var trinum = Helper.Methods.GetTriangleNumber(n);
				var divs = Helper.Methods.GetFactors((int)trinum);
				var count = divs.Count();

				if (count > mindivs)
				{
					this.Solution = trinum.ToString();
					this.Hint = "n = " + n + " - divisors: " + count;
					return;
				}

				n++;
			}
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

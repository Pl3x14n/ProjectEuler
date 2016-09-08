using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem015 : IProblem
	{

		public void CalculateSolution()
		{
			const int gridsize = 20;

			//In a m * n - grid, the way from the UL to the BR is m + n steps long.
			//Additionally you know, that you have to move m-times right (R) and n-times down (D)
			//I.e.: RRDRDD (3x3-grid). To calculate all possible combinations of that, replace the D with nothing in mind.
			//--> RR-R-- (3x3-grid), and the question is, how many combinations there are, to place m (R)'s on (m+n) places.
			//--> nCr(m+n, m)


			this.Solution = Helper.Methods.nCr(gridsize * 2, gridsize).ToString();
			this.Hint = "= nCr(" + gridsize * 2 + ", " + gridsize + ")";

		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

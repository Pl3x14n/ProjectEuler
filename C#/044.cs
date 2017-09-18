using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem044 : IProblem
	{

		public void CalculateSolution()
		{
			Func<double, bool> isInt = (d => Math.Abs(d - (int)d) < Helper.Methods.Epsilon);
			Func<long, bool> isPentagonal = (x => isInt((Math.Sqrt(24 * x + 1) + 1) / 6));

			var pairs = new List<Tuple<int,int>>();

			for (var j = 1; ; j++)
			{
				for (var k = 1; k <= j; k++)
				{
					var pj = Helper.Methods.GetPentagonalNumber(j);
					var pk = Helper.Methods.GetPentagonalNumber(k);
					if (!isPentagonal(pj + pk) || !isPentagonal(pj - pk))
						continue;

					this.Solution = (pj - pk).ToString();
					this.Hint = string.Format("j = {0} and k = {1}", j, k);
					return;
				}
			}
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem052 : IProblem
	{

		public void CalculateSolution()
		{
			var digits = new Dictionary<int, int[]>();
			var found = false;
			var n = 0;

			for (var exp = 0; !found; exp++)
			{
				for (n = (int)Math.Pow(10, exp); n <= Math.Pow(10, exp + 1) / 6 && !found ; n++)
				{
					var failed = false;
					for (var factor = 1; factor <= 6 && !failed; factor++)
					{
						if (!digits.ContainsKey(n * factor))
							digits.Add(n * factor, Helper.Methods.GetAllDigits(n * factor)
							                             .OrderBy(d => d)
							                             .ToArray());

						if (!digits[n].SequenceEqual(digits[n * factor]))
							failed = true;
					}

					found = !failed;
				}
			}

			this.Solution = (n-1).ToString();	//n will be incremented in second for-loop before the loop will be aborted
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

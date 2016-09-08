using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem009 : IProblem
	{

		public void CalculateSolution()
		{
			for (var a = 1; a < 333; a++)
			{
				for (var b = a + 1; b < 1000 - a; b++)
				{
					var c = 1000 - a - b;
					if (a * a + b * b != c * c)
						continue;

					this.Solution = (a * b * c).ToString();
					this.Hint = a + "² + " + b + "² = " + c + "²";
					return;
				}
			}
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

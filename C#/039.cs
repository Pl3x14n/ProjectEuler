using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem039 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 1000;

			var perisols = new int[limit + 1];

			for (var p = 4; p <= limit; p++)
			{

				var counter = 0;
				
				for (var a = 0; a <= p / 3; a++)
					for (var b = a + 1; b <= (p - a) / 2; b++)
					{
						var c = p - b - a;
						if (c > b && c * c == a * a + b * b)
							counter++;
					}

				perisols[p] = counter;
			}

			var max = perisols.Max();
			this.Solution = perisols.ToList().IndexOf(max).ToString();
			this.Hint = max + " solutions";
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

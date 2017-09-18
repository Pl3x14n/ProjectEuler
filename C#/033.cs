using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem033 : IProblem
	{

		public void CalculateSolution()
		{
			var sol = new Helper.Fraction(1);

			for (var nomi = 10; nomi < 100; nomi++)
			{
				for (var denu = nomi + 1; denu < 100; denu++)
				{
					var d1 = Helper.Methods.GetAllDigits(nomi).ToList();
					var d2 = Helper.Methods.GetAllDigits(denu).ToList();

					if (!d1.Any(d2.Contains))
						continue;

					var doubleddigit = d1.First(d2.Contains);

					if (doubleddigit == 0)
						continue;

					var d1Short = d1.FirstOrDefault(d => d != doubleddigit);
					var d2Short = d2.FirstOrDefault(d => d != doubleddigit);

					if (d2Short == 0)
						continue;

					if (!(Math.Abs((float)nomi / denu - (float)d1Short / d2Short) < Helper.Methods.Epsilon))
						continue;

					//Solution found
					sol *= new Helper.Fraction(nomi, denu);
				}
			}


			this.Solution = sol.Denominator.ToString();
			this.Hint = sol.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

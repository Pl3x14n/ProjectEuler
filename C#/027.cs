using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem027 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 999;
			var coefficients = new Dictionary<Tuple<int, int>, int>();

			for (var a = -limit; a <= limit; a++)
			{
				for (var b = 2; b <= limit; b++)
				{
					//b has to be prime, cause for any a, the formula will return b if n == 0
					if (!Helper.Methods.IsPrime(b))
						continue;

					Func<int, int> formula = (n => n * n + a * n + b);

					var i = 0;
					while (Helper.Methods.IsPrime(formula(i)))
						i++;

					coefficients.Add(new Tuple<int, int>(a, b), i);

				}
			}

			var sol = coefficients.Aggregate((current, next) => current.Value < next.Value ? next : current);

			this.Solution = (sol.Key.Item1 * sol.Key.Item2).ToString();
			this.Hint = "n² + " + sol.Key.Item1 + "*n + " + sol.Key.Item2 + " => " + sol.Value + " primes";
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

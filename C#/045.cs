using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using System.Diagnostics;
	using ProjectEuler.Helper;

	class Problem045 : IProblem
	{

		public void CalculateSolution()
		{
			// Each Hex is Tri, so checking Tri is redundant.
			// Iterating the Hexagonals makes more sense, cause below a limit are less hexagonals than pentagonals
			
			// Equality:
			// P(y) = H(z)
			// 0.5y * (3*y - 1) = z * (2 * z - 1)
			// 1.5y² - 0.5y = 2z² - z						| / 1.5
			// y² - y/3 = 4z²/3 - 2z/3						| + (1/6)² (to complete the square) 
			// y² - y/3 + (1/6)² = 4z²/3 - 2z/3 + (1/6)²		
			// (y - 1/6)² = 4z²/3 - 2z/3 + (1/6)²			|Square root
			// y - 1/6 = SQRT(4z²/3 - 2z/3 + (1/6)²)			| + 1/6
			// y = SQRT(4z²/3 - 2z/3 + 1/36) + 1/6

			var fourthirds = new Fraction(4, 3);
			var twothirds = new Fraction(2, 3);
			var oneoverthirtysix = new Fraction(1, 36);

			var sols = new List<Tuple<int, int, int, long>>();	//T, P, H, number
			for (var z = 1; ; z++)
			{
				var y = Math.Sqrt((fourthirds * z * z - twothirds * z + oneoverthirtysix).ToDouble()) + 1 / 6D;
				if (!(y % 1 < Helper.Methods.Epsilon))
					continue;

				//The xth triangular number == the yth pentagonal number == zth hexagonal number
				var x = 2 * z - 1;
				sols.Add(Tuple.Create(x, (int)y, z, Helper.Methods.GetTriangleNumber(x)));

				if (sols.Count == 3)
					break;
			}

			this.Solution = sols[2].Item4.ToString();
			this.Hint = string.Format("= T({0}) = P({1}) = H({2})", sols[2].Item1, sols[2].Item2, sols[2].Item3);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

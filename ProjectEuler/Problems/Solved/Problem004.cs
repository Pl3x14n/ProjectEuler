using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using System.Diagnostics;

	class Problem004 : IProblem
	{

		public void CalculateSolution()
		{
			const int digits = 3;
			var min = (int)Math.Pow(10, digits - 1);
			var max = (int)Math.Pow(10, digits) - 1;

			var palindroms = Enumerable.Range(min, max - min + 1).Select(n => n * (int)Math.Pow(10, digits) + int.Parse(string.Join("", n.ToString().Reverse()))).ToArray();
			var possfactors = Enumerable.Range(min, max - min + 1).ToArray();

			foreach (var p in palindroms.Reverse())
			{
				var factors = Helper.Methods.GetFactors(p).OrderBy(f => f);
				var validfactors = factors.Where(possfactors.Contains).ToArray();
				var products = validfactors.Where(f => validfactors.Any(f2 => Math.Abs(f2 - p / f) < Helper.Methods.Epsilon))
				                           .Where(f => f < p / f)
				                           .Select(f => new[] {f, p / f})
				                           .ToList();

				if (products.ToList().Count == 0)
					continue;


				this.Solution = p.ToString();
				this.Hint = "= " + string.Join(" = ", products.Select(pro => pro[0] + " * " + pro[1]));
				break;
			}
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

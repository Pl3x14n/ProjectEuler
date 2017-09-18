using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem032 : IProblem
	{

		public void CalculateSolution()
		{
			//Cause 99 * 99 = 9801, the product length is == 4 digits, and 
			const int limit = (int)1E4;

			var products = new List<int>();
			for (var i = limit - 1; i > limit / 10; i--)
			{
				var facts = Helper.Methods.GetFactors(i).Where(f => f * f <= i);
				var identities = facts.Select(f => f.ToString() + (i / f) + i).ToList();

				if (identities.Where(id => id.Length == 9)
				              .Select(int.Parse)
				              .Any(Helper.Methods.IsPandigital))
					products.Add(i);
			}

			this.Solution = products.Sum().ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

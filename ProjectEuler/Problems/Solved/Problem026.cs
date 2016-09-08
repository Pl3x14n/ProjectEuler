using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem026 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 1000;

			var pclength = new Dictionary<int, int>(); //periodic cycle

			for (var d = 2; d <= limit; d++)
			{

				//Division by hand
				var num = 1;
				var rems = new List<int>();
				var length = 0;
				while (true)
				{
					int rem;
					Math.DivRem(num, d, out rem);

					if (rem == 0)
						break;

					if (rems.Contains(rem))
					{
						length = rems.Count - rems.IndexOf(rem);
						break;
					}

					rems.Add(rem);
					num = rem * 10;
				}

				//Collect all periodic cycle lengths
				pclength.Add(d, length);
			}


			var sol = pclength.Aggregate((current, next) => current.Value < next.Value ? next : current);
			this.Solution = sol.Key.ToString();
			this.Hint = "Length: " + sol.Value;
		}




		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

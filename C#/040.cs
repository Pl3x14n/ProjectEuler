using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem040 : IProblem
	{

		public void CalculateSolution()
		{
			var pointers = Enumerable.Range(0, 7)
			                         .Select(p => (int)Math.Pow(10, p))
			                         .ToArray();
			var numbercount = Enumerable.Range(0, 8)
			                        .Select(n => 9 * (int)Math.Pow(10, n-1))
			                        .ToArray();

			var digs = new List<int>();
			foreach (var p in pointers)
			{
				var tmp = p;
				var len = 1;
				while (true)
				{
					if (tmp > len * numbercount[len])
					{
						tmp -= len * numbercount[len];
						len++;
					}
					else
						break;
				}


				int rem;
				var div = Math.DivRem(tmp, len, out rem);

				var n = (int)Math.Pow(10, len - 1) + div;
				if (len == 1)
					n--;

				var dig = Helper.Methods.GetAllDigits(n)
					.ToArray()[rem != 0 ? rem - 1 : 0];

				digs.Add(dig);
			}

			var product = digs.Aggregate((curr, next) => curr * next);
			this.Solution = product.ToString();
			this.Hint = "= " + string.Join(" x ", digs);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

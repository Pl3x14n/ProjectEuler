using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem021 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 10000;
			Func<int, int> d = (n => Helper.Methods.GetFactors(n)
			                               .Sum() - n);

			var sum = 0;

			for (var i = 1; i <= limit; i++)
			{
				var divsum = d(i);
				var complement = d(divsum);

				if (i == complement && i != divsum)
					sum += i;	//the complement will be added later;
			}

			this.Solution = sum.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

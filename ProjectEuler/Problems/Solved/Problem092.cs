using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem092 : IProblem
	{

		public void CalculateSolution()
		{
			var maxn = (int)1E7;

			var arrivals = new Arrival[maxn];
			arrivals[1] = Arrival.N1;
			arrivals[89] = Arrival.N89;

			
			for (var i = 2; i < maxn; i++)
			{
				var elements = new List<int>() { i };
				while (true)
				{
					var lastelement = elements.Last();
					if (arrivals[lastelement] != Arrival.Unknown)
					{
						elements.ForEach(e => arrivals[e] = arrivals[lastelement]);
						break;
					}
					
					elements.Add(Helper.Methods.GetAllDigits(lastelement).Select(d => d * d).Sum());
				}
			}

			Solution = arrivals.Count(a => a == Arrival.N89).ToString();
		}


		private enum Arrival
		{
			Unknown,
			N1,
			N89
		}



		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem019 : IProblem
	{

		public void CalculateSolution()
		{
			var begin = new DateTime(1901, 1, 1);
			var end = new DateTime(2000, 12, 31);

			var count = 0;
			for (var curr = begin; curr < end; curr = curr.AddMonths(1))
				if (curr.DayOfWeek == DayOfWeek.Sunday)
					count++;


			this.Solution = count.ToString();

		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

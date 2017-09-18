using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem007 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = 10001;
			var counter = 1;	//2 is prime, but will be never checked
			var n = 1;

			while (counter < limit)
			{
				n += 2;
				if (Helper.Methods.IsPrime(n))
					counter++;
			}

			this.Solution = n.ToString();

		}

		

		public string Solution { get; private set; }

		public string Hint { get; private set; }
	}
}

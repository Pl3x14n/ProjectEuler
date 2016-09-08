using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem025 : IProblem
	{

		public void CalculateSolution()
		{
			const int length = 1000;

			//If the digit count of f(n) has to be greater than 1000, it means
			// f(n)							> 10**999										|f(n) = phi**n / sqrt(5)
			// phi**n / sqrt(5)				> 10**999
			// phi**n / 5**0.5				> 10**999										|lg()
			// lg(phi**n / 5**0.5)			> lg(10**999)
			// lg(phi**n) - lg(5**0.5)		> lg(10**999)
			// lg(phi) * n - lg(5) * 0.5	> lg(10) * 999									|+ lg(5) * 0.5
			// lg(phi) * n					> lg(10) * 999 + lg(5) * 0.5					|/ lg(phi)
			// n							> (lg(10) * 999 + lg(5) * 0.5) / lg(phi)

			var min = (Math.Log10(10) * (length - 1) + Math.Log10(5) * 0.5) / Math.Log10(Helper.Methods.Phi);
			var n = Math.Ceiling(min);
			this.Solution = n.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

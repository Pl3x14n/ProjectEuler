using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem003 : IProblem
	{

		public void CalculateSolution()
		{
			var facts = Helper.Methods.GetPrimeFactors(600851475143);

			this.Solution = facts.Last().ToString();
			this.Hint = string.Join(" * ", facts);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

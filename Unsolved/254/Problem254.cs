using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem254 : IProblem
	{

		public void CalculateSolution()
		{
			var sum = 0;
			for (var i = 1; i <= 150; i++)
			{
				sum += sg(i);
				Console.WriteLine(i);
			}

			this.Solution = sum.ToString();
		}


		private readonly int[] _facts = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800 };
		public int f(int n)		//SumOfFactsOfDigits(n)
		{
			var digits = Helper.Methods.GetAllDigits(n);
			return digits.Select(d => _facts[d])
			             .Sum();
		}

		private int sf(int n)	//SumOfDigits of f(n)
		{
			return Helper.Methods.GetAllDigits(f(n))
			             .Sum();
		}

		private int g(int i)
		{
			int n;
			for (n = 1; sf(n) != i; n++) { }
			return n;
		}

		private int sg(int i)	//SumOfDigits of g(i)
		{
			return Helper.Methods.GetAllDigits(g(i))
						 .Sum();
		}





		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

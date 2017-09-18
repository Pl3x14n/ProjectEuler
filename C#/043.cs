using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem043 : IProblem
	{

		public void CalculateSolution()
		{
			var sum = 0L;
			var avaiable = Enumerable.Repeat(true, 10).ToArray();
			Search(0, new int[10], avaiable, ref sum);
			this.Solution = sum.ToString();
		}
		

		private void Search(int index, int[] digits, bool[] isAvaiable, ref long sum)
		{
			if (index > 9)
			{
				if (SatisfiesCondition(digits))
					sum += (long)Helper.Methods.DigitsToNumber(digits);

				return;
			}


			for (var i = (index == 0 ? 1 : 0); i < 10; i++) //useless to start a number (index == 0) with a zero
				if (isAvaiable[i])
				{
					digits[index] = i;
					isAvaiable[i] = false;
					Search(index + 1, digits, isAvaiable, ref sum);
					isAvaiable[i] = true;
				}
		}

		private bool SatisfiesCondition(int[] digits)
		{
			var primes = new[] { 2, 3, 5, 7, 11, 13, 17 };

			for (var i = 1; i < 8; i++)
			{
				var temp = 100 * digits[i] + 10 * digits[i + 1] + digits[i + 2];
				if (temp % primes[i - 1] != 0)
					return false;
			}
			return true;
		}



		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

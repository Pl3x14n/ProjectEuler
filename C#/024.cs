using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem024 : IProblem
	{

		public void CalculateSolution()
		{
			const int target = (int)1E6;
			const int range = 10;

			var nums = Enumerable.Range(0, range)
			                     .ToList();
			
			var indices = new List<int>();
			var curr = target - 1;
			for (var i = range - 1; i >= 0; i--)
			{
				var rem = 0;
				var fact = (int)Helper.Methods.Factorial(i);
				var div = Math.DivRem(curr, fact, out rem);
				indices.Add(div);
				curr = rem;
			}

			var sb = new StringBuilder();
			foreach (var i in indices)
			{
				sb.Append(nums[i]);
				nums.RemoveAt(i);
			}
			
			this.Solution = sb.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

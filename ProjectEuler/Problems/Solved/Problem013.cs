using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem013 : IProblem
	{

		public void CalculateSolution()
		{
			var lines = StartUp.GetFileContent("Problem013.txt");
			var nums = lines.Select(s => long.Parse(s.Substring(0, 11)));
			var sum = nums.Sum();

			this.Solution = sum.ToString()
			                   .Substring(0, 10);



		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

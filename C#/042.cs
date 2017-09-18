using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem042 : IProblem
	{

		public void CalculateSolution()
		{
			var names = Helper.StartUp.GetFileContent("Problem042.txt")
			                  .Aggregate((curr, next) => curr + next)
			                  .Split(',')
			                  .Select(name => name.Replace("\"", ""));

			var triangularNumbers = Enumerable.Range(1, 25).Select(Helper.Methods.GetTriangleNumber).ToArray();

			var scores = names.Select(name => (long)name.Select(letter => (byte)letter - 64)
			                                      .Sum());

			var sol = scores.Count(triangularNumbers.Contains);
			this.Solution = sol.ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

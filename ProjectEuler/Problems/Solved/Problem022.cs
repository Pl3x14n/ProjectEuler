using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem022 : IProblem
	{

		public void CalculateSolution()
		{
			var line = Helper.StartUp.GetFileContent("Problem022.txt").Aggregate((current, l) => current + l);
			var names = line.Split(',')
			                .Select(s => s.Replace("\"", ""))
			                .OrderBy(n => n);
			
			var alphavalues = names.Select(s => s.Select(c => (int)c - 64).Sum()).ToArray();
			var indices = names.Select((n, index) => index + 1).ToArray();
			var score = alphavalues.Zip(indices, (value, index) => value * index);

			this.Solution = score.Sum().ToString();
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

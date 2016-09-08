using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using System.Diagnostics;
	using Helper;

	class Test : IProblem
	{

		public void CalculateSolution()
		{
			var n = 40023983;
			var sw = Stopwatch.StartNew();

			var p = new List<Exponentiation>();
			for (var i = 1; i <= 100; i++)
				p = Helper.Methods.GetPrimeFactors(n).ToList();

			Console.WriteLine(sw.ElapsedMilliseconds);;
		}







		public string Solution { get; private set; }
		public string Hint { get; private set; }
	}
}

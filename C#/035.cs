using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem035 : IProblem
	{

		public void CalculateSolution()
		{
			const int limit = (int)1E6;
			var primes = Helper.Methods.SieveOfEratosthenes(limit).ToArray();


			//Returns all rotations of a number (reached by taking the first digit to the back), e.g. 719 => {719, 197, 971}
			Func<int, int[]> rotations = (n =>
										  {
											  var rets = new List<int>();
											  var digs = Helper.Methods.GetAllDigits(n).ToArray();
											  for (var i = 0; i < digs.Count(); i++)
											  {
												  var currn = new List<int>();
												  for (var d = i; d - i < digs.Count(); d++)
													  currn.Add(d >= digs.Count() ? digs[d - digs.Count()] : digs[d]);
												  rets.Add((int)Helper.Methods.DigitsToNumber(currn));
											  }

											  return rets.ToArray();
										  });


			

			var circprimes = (from p in primes
			                  let digs = Helper.Methods.GetAllDigits(p)
			                                   .ToArray()
			                  where digs.All(d => d % 2 != 0 && d != 5) || digs.Count() == 1
			                  let rots = rotations(p)
			                  where rots.All(primes.Contains)
			                  select p).ToList();

			this.Solution = circprimes.Count().ToString();
			this.Hint = string.Join(", ", circprimes);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

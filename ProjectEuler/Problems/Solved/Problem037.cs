using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem037 : IProblem
	{


		public void CalculateSolution()
		{
			var sol = GetTruncablePrimes(2)
				.Concat(GetTruncablePrimes(3))
				.Concat(GetTruncablePrimes(5))
				.Concat(GetTruncablePrimes(7))
				.ToList();
			sol.Sort();

			this.Solution = sol.Skip(4)		//Skip 2,3,5,7
			                   .Take(11)
			                   .Sum()
			                   .ToString();
			this.Hint = string.Join(", ", sol);

		}

		public void CalculateSolution2()
		{
			const int limit = 11;

			var primes = new List<int> { 2, 3, 5, 7 };
			var found = new List<int>();

			Func<int, int> truncateLR = (n => n % (int)Math.Pow(10, (int)Math.Log10(n)));
			Func<int, int> truncateRL = (n => n / 10);


			for (var i = 11; found.Count() != limit; i+=2)
			{

				//Check prime
				if (!primes.Contains(i))
				{
					if (Helper.Methods.IsPrime(i))
						primes.Add(i);
					else
						continue;
				}

				//Only trucatable prime, when all digits ∈ {1,3,7,9}
				var digs = Helper.Methods.GetAllDigits(i);
				if (digs.Any(d => d % 2 == 0 || d == 5))
					continue;



				//Get truncates
				var left = i;
				var right = i;
				var truncates = new List<int>();
				while (true)
				{
					if (left >= 1)
					{
						truncates.Add(left);
						left = truncateLR(left);
					}

					if (right >= 1)
					{
						truncates.Add(right);
						right = truncateRL(right);
					}

					if (left < 1 && right < 1)
						break;
				}

				truncates = truncates.Distinct()
									 .OrderBy(t => t)
									 .ToList();

				//Check all truncates
				if (truncates.All(primes.Contains))
				{
					found.Add(i);
					Console.WriteLine(i);
				}

			}



			this.Solution = found.Sum().ToString();
			this.Hint = string.Join(", ", found);
		}



		public IEnumerable<int> GetTruncablePrimes(int n)
		{
			Func<int, int> truncateLR = (i => i % (int)Math.Pow(10, (int)Math.Log10(i)));
			Func<int, int> truncateRL = (i => i / 10);

			if (!Helper.Methods.IsPrime(n) || n > 1E8) //Just anything as limit
				yield break;

			//Get truncates
			var left = n;
			var right = n;
			var truncates = new List<int>();
			while (true)
			{
				if (left >= 1)
				{
					truncates.Add(left);
					left = truncateLR(left);
				}

				if (right >= 1)
				{
					truncates.Add(right);
					right = truncateRL(right);
				}

				if (left < 1 && right < 1)
					break;
			}

			//Solution
			if (truncates.All(Helper.Methods.IsPrime))
				yield return n;


			foreach (var p in GetTruncablePrimes(10 * n + 1))
				yield return p;
			foreach (var p in GetTruncablePrimes(10 * n + 3))
				yield return p;
			foreach (var p in GetTruncablePrimes(10 * n + 7))
				yield return p;
			foreach (var p in GetTruncablePrimes(10 * n + 9))
				yield return p;
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

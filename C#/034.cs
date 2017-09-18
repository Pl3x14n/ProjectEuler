using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem034 : IProblem
	{


		public void CalculateSolution()
		{

			//Get factorials
			var factorials = new Dictionary<int, int>();
			Enumerable.Range(0, 10)
			          .ToList()
			          .ForEach(n => factorials.Add(n, (int)Helper.Methods.Factorial(n)));

			//All sums
			var factsums = Enumerable.Range(1, 7)
									 .Select(digits => factorials.Select(kvp => kvp.Value)
																	.Combinations(digits)
																	.Select(comb => comb.Sum())
																	.ToArray())
			                         .ToArray();

			//All terms collected in a int[], i.e. 1! +  4! + 5! --> new[] {1, 4, 5}
			var factterms = Enumerable.Range(1, 7)
			                           .Select(digits => factorials.Select(kvp => kvp.Key)
			                                                        .Combinations(digits)
			                                                        .Select(comb => comb.ToArray())
			                                                        .ToArray())
			                           .ToArray();

			//Zip the terms and sums, resulting in a Tuple<summands int[], sum int>
			var factequations = factterms.Zip(factsums, (terms, sums) => terms.Zip(sums, Tuple.Create)
			                                                                  .ToArray())
			                             .Aggregate((current, next) => current.Concat(next)
			                                                                  .ToArray())					
			                             .ToArray();


			//elements of factequations, where the summands int[] has the same elements as the digits of the sum
			var sols = factequations.Where(tp => tp.Item1.Intersect(Helper.Methods.GetAllDigits(tp.Item2))
			                                       .Count() == tp.Item1.Count())
			                        .ToList();

			//solution = the sum of the sols
			this.Solution = sols.Skip(2) //1 and 2 do not count
			                    .Select(tp => tp.Item2) 
			                    .Sum()
			                    .ToString();

			this.Hint = string.Join(", ", sols.Select(tp => tp.Item2));
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

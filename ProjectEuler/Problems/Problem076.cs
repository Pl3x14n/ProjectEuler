using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem076 : IProblem
	{

		public void CalculateSolution()
		{
			var amount = 0;

			Action<IEnumerable<int>> callback = perm =>
			                                    {
				                                    Console.WriteLine(string.Concat(perm));
				                                    amount++;
			                                    };

			SummandAnalize(5, callback);

			this.Solution = amount.ToString();
		}



		public void SummandAnalize(int targetSum, Action<IEnumerable<int>> outputCallback)
		{
			//Optimierung: Es werden nur die Kinder generiert, die targetSum nicht erreichen. Das Kind, welches targetSum erreicht, wird direkt ausgegeben.
			List<int> list = new List<int>();
			Action<int> recurse = null;
			recurse = (currSum) =>
			          {
				          var missing = targetSum - currSum;
				          list.Add(0);
						  for (var i = 1; i <= missing - 1 && (list.Count() == 1 || i <= list[list.Count - 2]); i++)
				          {
					          list[list.Count - 1] = i;
					          recurse(currSum + i);
				          }
				          list[list.Count - 1] = missing;
				          //targetSum erreicht
				          outputCallback(list);
				          list.RemoveAt(list.Count - 1);
			          };
			recurse(0);
		}





		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem031 : IProblem
	{

		public void CalculateSolution()
		{
			var amounts = 0;
			var coins = new[] {1, 2, 5, 10};

			Action<IEnumerable<int>> callback = perm =>
			                                    {
				                                    Console.WriteLine(string.Concat(perm));
				                                    amounts++;
			                                    };

			CoinSums(coins, 10, callback);

			this.Solution = amounts.ToString();
		}



		public void CoinSums(int[] coins, int targetSum, Action<IEnumerable<int>> outputCallback)
		{

			List<int> list = new List<int>();
			Action<int> recurse = null;
			recurse = (currSum) =>
			{
				if (currSum == targetSum)
				{
					outputCallback(list);
				}
				else if (currSum < targetSum)
				{
					list.Add(0);
					foreach(var coin in coins.TakeWhile(c => c <= targetSum - currSum))
					{
						list[list.Count - 1] = coin;
						recurse(currSum + coin);
					}
					list.RemoveAt(list.Count - 1);
				}
			};

			recurse(0);
		}




		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

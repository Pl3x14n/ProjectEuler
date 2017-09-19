using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem018 : IProblem
	{

		public void CalculateSolution()
		{
			var lines = Helper.StartUp.GetFileContent("Problem018.txt");
			var nums = lines.Select(l => l.Split(' ')
			                              .Select(int.Parse)
			                              .ToArray()).ToList();		//I = row, J = column

			var average = nums.Average(ns => ns.Average());

			var starts = nums.Last().Select((n, j) => new Index(nums.Count - 1, j)).Where(i => nums.Last()[i.J] > average);


			starts.ToList()
			      .ForEach(s =>
			               {
				               
			               });

			Console.Write(3);

		}


		public IEnumerable<Index> GetNextIndices(Index i)
		{
			if (i.I == 0)
				yield break;

			if (i.J != 0)
				yield return new Index(i.I - 1, i.J - 1);

			if (i.J != i.I)
				yield return new Index(i.I - 1, i.J - 1);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

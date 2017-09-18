using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem011 : IProblem
	{

		public void CalculateSolution()
		{
			const int gridsize = 20;
			const int subsetsize = 4;

			//Load file into register
			var nums = new List<List<int>>(); //list of rows
			var lines = StartUp.GetFileContent("Problem011.txt");
			lines.ToList()
			     .ForEach(l => nums.Add(l.Split(' ')
			                             .Select(int.Parse)
			                             .ToList()));


			//Subsets
			var subsets = new List<int[]>();

			//Horizontal
			for (var row = 0; row < gridsize; row++)
			{
				for (var col = 0; col < gridsize - subsetsize + 1; col++)
				{
					var tmp = new List<int>();
					for (var offset = 0; offset < subsetsize; offset++)
						tmp.Add(nums[row][col + offset]);
					subsets.Add(tmp.ToArray());
				}
			}

			//Vertical
			for (var row = 0; row < gridsize - subsetsize + 1; row++)
			{
				for (var col = 0; col < gridsize; col++)
				{
					var tmp = new List<int>();
					for (var offset = 0; offset < subsetsize; offset++)
						tmp.Add(nums[row + offset][col]);
					subsets.Add(tmp.ToArray());
				}
			}

			//Diagonal 1  (\)
			for (var row = 0; row < gridsize - subsetsize + 1; row++)
			{
				for (var col = 0; col < gridsize - subsetsize + 1; col++)
				{
					var tmp = new List<int>();
					for (var offset = 0; offset < subsetsize; offset++)
						tmp.Add(nums[row + offset][col + offset]);
					subsets.Add(tmp.ToArray());
				}
			}

			//Diagonal 2 (/)
			for (var row = subsetsize; row < gridsize; row++)
			{
				for (var col = 0; col < gridsize - subsetsize + 1; col++)
				{
					var tmp = new List<int>();
					for (var offset = 0; offset < subsetsize; offset++)
						tmp.Add(nums[row - offset][col + offset]);
					subsets.Add(tmp.ToArray());
				}
			}


			Func<int[], int> calculateProduct = (ia => ia.Aggregate((current, i) => current * i));

			var solsubset = subsets.Aggregate((s, current) => calculateProduct(s) > calculateProduct(current) ? s : current);
			var sol = calculateProduct(solsubset);

			this.Solution = sol.ToString();
			this.Hint = "= " + string.Join(" * ", solsubset);
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

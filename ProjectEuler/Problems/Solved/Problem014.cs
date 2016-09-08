using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	class Problem014 : IProblem
	{

		public void CalculateSolution()
		{
			var termsAfterElement = new int[(int)1E8];
			Func<ulong, ulong> nextCollatzElement = (n => n % 2 == 0 ? n / 2 : 3 * n + 1);
			var maxcount = int.MinValue;

			var sol = 0;
			for (var i = 1; i < 1E6; i++)
			{
				var count = 1;
				var next = (ulong)i;
				var seq = new List<ulong>();
				while (next != 1)
				{
					//Calculate next element
					seq.Add(next);
					next = nextCollatzElement(next);
					count++;

					//Go on
					if (next >= (ulong)termsAfterElement.Length || termsAfterElement[next] == 0)
						continue;

					//Break, if the next element was already calculated
					count += termsAfterElement[next];
					break;
				}

				//Backup each count of element in the sequence
				for (var c = 0; c < seq.Count; c++)
					if (seq[c] < (ulong)termsAfterElement.Length && termsAfterElement[seq[c]] == 0)
						termsAfterElement[seq[c]] = count - c - 1;


				//Save, if new highscore
				if (count <= maxcount)
					continue;

				maxcount = count;
				sol = i;
			}


			this.Solution = sol.ToString();
			this.Hint = "Terms: " + maxcount;
		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

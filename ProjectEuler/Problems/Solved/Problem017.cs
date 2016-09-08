using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem017 : IProblem
	{

		public void CalculateSolution()
		{
			var dic = new Dictionary<int, string>
			          {
				          {1, "one"},
				          {2, "two"},
				          {3, "three"},
				          {4, "four"},
				          {5, "five"},
				          {6, "six"},
				          {7, "seven"},
				          {8, "eight"},
				          {9, "nine"},
				          {10, "ten"},
				          {11, "eleven"},
				          {12, "twelve"},
				          {13, "thirteen"},
				          {14, "fourteen"},
				          {15, "fifteen"},
				          {16, "sixteen"},
				          {17, "seventeen"},
				          {18, "eighteen"},
				          {19, "nineteen"},
				          {20, "twenty"},
				          {30, "thrity"},
				          {40, "forty"},
				          {50, "fifty"},
				          {60, "sixty"},
				          {70, "seventy"},
				          {80, "eighty"},
				          {90, "ninety"},
				          {100, "hundred"},
				          {1000, "thousand"}
			          };

			var totalletters = 0;

			for (var n = 1; n <= 1000; n++)
			{

				var thousands = n / 1000;
				var hundreds = n % 1000 / 100;
				var tens = n % 100 / 10; 
				var ones = n % 10;

				var word = "";

				if (thousands != 0)
					word += dic[thousands] + " " + dic[1000];


				if (hundreds != 0)
					word += dic[hundreds] + " " + dic[100];

				if (hundreds != 0 && (tens != 0 || ones != 0))
					word += " and ";

				if ((tens < 2 || (tens == 2 && ones == 0)) && (tens != 0 || ones != 0))
					word += dic[tens * 10 + ones];
				else if (tens != 0)
					word += dic[tens * 10];

				if (tens >= 2 && ones != 0)
					word += "-" + dic[ones];

				totalletters += word.Count(c => c != ' ' && c != '-');
			}

			this.Solution = totalletters.ToString();


		}


		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

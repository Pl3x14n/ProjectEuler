using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	class Problem038 : IProblem
	{

		public void CalculateSolution()
		{
			// 918273645 has to be beaten - thus we need a 9 in front
			
			// 2 digit number: 
			// 	9? * (1,2,3)	=> 8 digits
			// 	9? * (1,2,3,4)	=> 11 digits
			
			// 3 digit number:
			// 	9?? * (1,2)		=> 7 digits
			// 	9?? * (1,2,3)	=> 11 digits
			
			// 4 digit number
			// 	9??? * (1,2)	=> 9 digits	

			var n = 0;
			for (n = 9876;; n--)
			{
				if (Helper.Methods.IsPandigital(n * (int)1E5 + 2 * n))
					break;
			}

			this.Solution = (n * (int)1E5 + 2 * n).ToString();
			this.Hint = "= " + n + " * (1, 2)";
		}




		public string Solution { get; private set; }

		public string Hint { get; private set; }
	}
}

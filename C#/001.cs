using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ProjectEuler.Problems
{
    class Problem001 : IProblem
    {


        public void CalculateSolution()
        {
            const int limit = 999;
            var sol = Enumerable.Range(1, limit).Where(n => n % 3 == 0 || n % 5 == 0).Sum();

            this.Solution = sol.ToString();
        }


        public string Solution { get; private set; }

        public string Hint { get; private set; }

    }
}
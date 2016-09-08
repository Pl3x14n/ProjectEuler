namespace ProjectEuler
{
	using System;
	using System.Collections.Generic;
	using System.Diagnostics;
	using System.Linq;
	using ProjectEuler.Helper;

	class Program
	{
		static void Main(string[] args)
		{
			// ===========================
			const int problem = 92;
			// ===========================




			//Start up
			Console.Title = "Project Euler Solutions";
			Console.SetWindowSize(100, 20);
			Console.SetBufferSize(100, 2010);
			StartUp.EnableQuickEditMode();
			var sw = new Stopwatch();
			var p = StartUp.GetProblemSolution(problem);



			//Solution is non-existent
			if (p == null)
			{
				Console.WriteLine("Solution for Problem No. " + problem + " isn't existing, sorry.");
				Console.ReadLine();
				return;
			}

			//Get solution
			var totalMemory = GC.GetTotalMemory(false);
			sw.Start();
			p.CalculateSolution();
			sw.Stop();
			var totalMemory2 = GC.GetTotalMemory(false);

			//Output
			Console.WriteLine("Problem No. " + problem + "\n");
			Console.WriteLine("Solution:  \t" + p.Solution);
			Console.WriteLine("Hint: \t\t" + p.Hint);
			Console.WriteLine("Elapsed Time:  \t" + sw.Elapsed.TotalSeconds + "s");
			Console.WriteLine("Used memory: \t" + ((totalMemory2 - totalMemory) / 1024) + " KiB");

			StartUp.BringConsoleToFront();
			Console.ReadLine();


		}
	}
}

private void PE()
		{
			string path = @"C:\Users\Marek\Documents\Office\Coding\Project Euler\096  (44 von 50)\Grids";
			int sum = 0; 

			for (int grid = 1; grid <= 50; grid++)
			{
				string current = System.IO.Path.Combine(path, "Grid " + grid.ToString("00") + ".txt");


				Sudoku s = new Sudoku();
				Sudoku.Load(current, ref s);

				s.Solve(Sudoku.SolvingTechnique.BackTracking);

				int number = s.GetCell(0, 0).Number * 100 + s.GetCell(0, 1).Number * 10 + s.GetCell(0, 2).Number * 1;
				sum += number;
			}

			MessageBox.Show(sum.ToString());
		}
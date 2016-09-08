using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Helper
{
	using System.IO;
	using System.Runtime.InteropServices;
	using System.Windows.Forms;

	static class StartUp
	{

		//QUICKEDIT
		[DllImport("kernel32.dll")]
		private static extern bool SetConsoleMode(IntPtr hConsoleHandle, int mode);

		[DllImport("kernel32.dll")]
		private static extern bool GetConsoleMode(IntPtr hConsoleHandle, out int mode);

		[DllImport("kernel32.dll")]
		private static extern IntPtr GetStdHandle(int handle);

		private const int STD_INPUT_HANDLE = -10;
		private const int ENABLE_QUICK_EDIT_MODE = 0x40 | 0x80;

		public static void EnableQuickEditMode()
		{
			int mode;
			var handle = GetStdHandle(STD_INPUT_HANDLE);
			GetConsoleMode(handle, out mode);
			mode |= ENABLE_QUICK_EDIT_MODE;
			SetConsoleMode(handle, mode);
		}




		//Returns the instance of the problem solution
		public static IProblem GetProblemSolution(int n)
		{
			if (n == 0)
				return (IProblem)Activator.CreateInstance(Type.GetType("ProjectEuler.Problems.Test", false));

			var t = Type.GetType("ProjectEuler.Problems.Problem" + n.ToString("D3"), false);
			return (IProblem)Activator.CreateInstance(t);
		}


		//Returns the content of a file
		public static string[] GetFileContent(string name)
		{
			var startup = Application.StartupPath;
			var parent = "..";

			var fullpath = Path.Combine(startup, parent, parent, @"Problems\Input", name);

			return File.ReadAllLines(fullpath);
		}


	}

}

namespace ProjectEuler
{
	interface IProblem
	{
		void CalculateSolution();

		string Solution { get; }
		string Hint { get; }
	}
}

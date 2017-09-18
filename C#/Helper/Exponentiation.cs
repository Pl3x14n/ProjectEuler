namespace ProjectEuler.Helper
{
	using System;

	class Exponentiation
	{

		public Exponentiation(int @base, int exponent)
		{
			this.Base = @base;
			this.Exponent = exponent;
		}



		public int Base { get; set; }

		public int Exponent { get; set; }

		public long Value { get { return (long)Math.Pow(this.Base, this.Exponent); } }



		public override string ToString()
		{
			return this.Base + (this.Exponent != 1 ? "**" + this.Exponent : "");
		}
	}
}

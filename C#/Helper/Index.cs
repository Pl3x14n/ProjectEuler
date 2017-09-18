using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Helper
{
	class Index
	{

		public int I { get; private set; }
		public int J { get; private set; }

		public Index(int i, int j)
		{
			this.I = i;
			this.J = j;
		}

		public override string ToString()
		{
			return string.Format("({0} | {1})", this.I, this.J);
		}

	}
}

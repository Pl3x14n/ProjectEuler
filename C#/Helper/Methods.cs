namespace ProjectEuler.Helper
{
	using System;
	using System.Collections.Generic;
	using System.Numerics;
	using System.Reflection;
	using System.Linq;

	static class Methods
	{

		public static IEnumerable<int> GetFibonacciSequence(int limit)
		{
			int fib = 0, n = 1;
			while ((fib = GetNthFibonacci(n)) <= limit)
			{
				yield return fib;
				n++;
			}
		}

		public static int GetNthFibonacci(int n)
		{
			return (int)(Math.Round(Math.Pow(Phi, n) / Math.Sqrt(5)));
		}

		public static IEnumerable<Exponentiation> GetPrimeFactors(long n)
		{
			if (IsPrime((int)n))
			{
				yield return new Exponentiation((int)n, 1);
				yield break;
			}

			var p = 2;
			while (n > 1)
			{
				var px = 0;
				while (n % p == 0)
				{
					n /= p;
					px++;
				}
				if (px != 0)
					yield return new Exponentiation(p, px);

				if (p == 2)
					p++;
				while (p < n && n % p != 0)
					p += 2;
			}

		}

		public static double Epsilon { get { return 5.960464E-6D; } }

		public static IEnumerable<int> GetFactors(int number)
		{
			int max = (int)Math.Sqrt(number);
			for (var factor = 1; factor <= max; factor++)
			{
				if (number % factor != 0)
					continue;

				yield return factor;
				if (factor != number / factor)
					yield return number / factor;
			}
		}

		public static long LCM(long a, long b)
		{
			return Math.Abs(a * b) / GCD(a, b);
		}

		public static long GCD(long a, long b)
		{
			return b == 0 ? a : GCD(b, a % b);
		}

		public static long GetTriangleNumber(int n)
		{
			return (long)n * (n + 1) / 2;
		}

		public static long GetPentagonalNumber(int n)
		{
			return (long)n * (3 * n - 1) / 2;
		}

		public static bool IsPrime(int n)
		{
			if (n < 2)
				return false;

			if (n % 2 == 0)
				return n == 2;

			for (var i = 3; i <= Math.Sqrt(n); i += 2)
				if (n % i == 0)
					return false;

			return true;
		}

		public static int[] GetPrimes(int limit)
		{
			var nums = Enumerable.Repeat(true, limit + 1).ToArray();
			nums[0] = false;
			nums[1] = false;

			var i = 2;
			while (i * i < limit)
			{
				for (var j = 2 * i; j <= limit; j += i)
					nums[j] = false;

				var next = i + 1;
				while (nums[next] == false)
					next++;

				i = next;
			}


			var primes = nums.Select((n, index) => n ? index : 0)
							 .Where(p => p != 0)
							 .ToArray();
			return primes;
		}

		public static int[] GetPrimes2(int max)
		{
			bool[] is_prime = new bool[max + 1];
			for (int i = 2; i <= max; i++)
				is_prime[i] = true;

			// Cross out multiples.
			for (int i = 2; i <= max; i++)
			{
				// See if i is prime.
				if (is_prime[i])
				{
					// Knock out multiples of i.
					for (int j = i * 2; j <= max; j += i)
						is_prime[j] = false;
				}
			}
			return is_prime.Select((b, index) => b ? index : -1).Where(i => i != -1).ToArray();
		}

		public static BigInteger Factorial(int n)
		{
			return n == 0 ? 1 : n * Factorial(n - 1);
		}

		public static double nCr(int n, int k)
		{
			return (double)(Factorial(n) / (Factorial(k) * Factorial(n - k)));
		}

		public static IEnumerable<IEnumerable<T>> Combinations<T>(this IEnumerable<T> elements, int k)
		{
			return k == 0 ? new[] { new T[0] } :
			  elements.SelectMany((e, i) =>
				elements.Skip(i).Combinations(k - 1).Select(c => (new[] { e }).Concat(c)));
		}

		public static IEnumerable<IEnumerable<T>> Permutations<T>(this IEnumerable<T> elements, IEnumerable<T> prefix = null)
		{
			if (prefix == null)
				prefix = new T[0];

			var arrele = elements.ToArray();
			var arrpre = prefix.ToArray();


			var len = arrele.Count();
			if (len == 0)
				yield return arrpre;

			for (var i = 0; i < len; i++)
				foreach (var perm in arrele.Take(i)
										   .Concat(arrele.Skip(i + 1))
										   .Permutations(arrpre.Concat(new[] { arrele[i] })))
					yield return perm;
		}

		public static double Phi { get { return (1 + Math.Sqrt(5)) / 2; } }

		public static IEnumerable<int> GetAllDigits(int n)
		{
			var len = (int)Math.Log10(n) + 1;

			for (var i = len; i >= 1; i--)
				yield return n % (int)Math.Pow(10, i) / (int)Math.Pow(10, i - 1);
		}

		public static bool IsPandigital(int n)
		{
			var digs = GetAllDigits(n).OrderBy(d => d).ToList();
			for (var pointer = 0; pointer < digs.Count() - 1; pointer++)
				if (digs[pointer] + 1 != digs[pointer + 1])
					return false;

			return true;
		}

		public static IEnumerable<int> SieveOfEratosthenes(long n)
		{
			var numbers = new bool[n + 1];
			for (var i = 1; i <= n; i++)
				numbers[i] = true;

			for (var i = 4; i <= n; i += 2)
				numbers[i] = false;

			for (var i = 3; i <= n; i += 2)
			{
				if (!numbers[i])
					continue;

				for (var j = (long)i * i; j <= n; j += i)
					if (numbers[j])
						numbers[j] = false;
			}

			for (var i = 2; i < numbers.Count(); i++)
				if (numbers[i])
					yield return i;
		}

		public static bool IsPalindromic(string s)
		{
			return s == new string(s.Reverse().ToArray());
		}

		public static bool AllElementsDiffrent<T>(IEnumerable<T> i)
		{
			return i.Distinct()
					.ToArray()
					.Count() == i.Count();
		}

		public static ulong DigitsToNumber(IEnumerable<int> ints)
		{
			return ints.Select((n, index) => (ulong)n * (ulong)Math.Pow(10, ints.Count() - index - 1))
					   .Aggregate((curr, next) => curr + next);
		}


		public static double Power(this double b, int exp)
		{
			var res = 1D;
			for (var counter = 1; counter <= exp; counter++)
				res *= b;
			return res;
		}

		public static long Power(this int b, int exp)
		{
			var res = 1;
			for (var counter = 1; counter <= exp; counter++)
				res *= b;
			return res;
		}

	}
}

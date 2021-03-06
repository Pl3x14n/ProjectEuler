﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Helper
{
	class Fraction
	{
		#region **** Constructors ****
		public Fraction()
		{
			Initialize(0, 1);
		}

		public Fraction(long iWholeNumber)
		{
			Initialize(iWholeNumber, 1);
		}

		public Fraction(double dDecimalValue)
		{
			var temp = ToFraction(dDecimalValue);
			Initialize(temp.Numerator, temp.Denominator);
		}

		public Fraction(string strValue)
		{
			var temp = ToFraction(strValue);
			Initialize(temp.Numerator, temp.Denominator);
		}

		public Fraction(long iNumerator, long iDenominator)
		{
			Initialize(iNumerator, iDenominator);
		}

		/// <summary>
		/// Internal function for constructors
		/// </summary>
		private void Initialize(long iNumerator, long iDenominator)
		{
			Numerator = iNumerator;
			Denominator = iDenominator;
			ReduceFraction(this);
		}

		#endregion



		#region **** Properties ****

		private long _iDenominator;
		public long Denominator
		{
			get
			{ return _iDenominator; }
			set
			{
				if (value != 0)
					_iDenominator = value;
				else
					throw new FractionException("Denominator cannot be assigned a ZERO Value");
			}
		}

		public long Numerator { get; set; }

		public long Value
		{
			set
			{
				this.Numerator = value;
				_iDenominator = 1;
			}
		}

		#endregion



		#region **** Methods ****

		/// <summary>
		/// The function returns the current Fraction object as double
		/// </summary>
		public double ToDouble()
		{
			return ((double)this.Numerator / this.Denominator);
		}

		/// <summary>
		/// The function returns the current Fraction object as a string
		/// </summary>
		public override string ToString()
		{
			string str;
			if (this.Denominator == 1)
				str = this.Numerator.ToString();
			else
				str = this.Numerator + "/" + this.Denominator;
			return str;
		}

		/// <summary>
		/// The function takes an string as an argument and returns its corresponding reduced fraction
		/// the string can be an in the form of and integer, double or fraction.
		/// e.g it can be like "123" or "123.321" or "123/456"
		/// </summary>
		public static Fraction ToFraction(string strValue)
		{
			int i;
			for (i = 0; i < strValue.Length; i++)
				if (strValue[i] == '/')
					break;

			if (i == strValue.Length)		// if string is not in the form of a fraction
				// then it is double or integer
				return (Convert.ToDouble(strValue));
			//return ( ToFraction( Convert.ToDouble(strValue) ) );

			// else string is in the form of Numerator/Denominator
			var iNumerator = Convert.ToInt64(strValue.Substring(0, i));
			var iDenominator = Convert.ToInt64(strValue.Substring(i + 1));
			return new Fraction(iNumerator, iDenominator);
		}


		/// <summary>
		/// The function takes a floating point number as an argument 
		/// and returns its corresponding reduced fraction
		/// </summary>
		public static Fraction ToFraction(double dValue)
		{
			try
			{
				checked
				{
					Fraction frac;
					if (dValue % 1 <= Helper.Methods.Epsilon)	// if whole number
					{
						frac = new Fraction((long)dValue);
					}
					else
					{
						var dTemp = dValue;
						long iMultiple = 1;
						var strTemp = dValue.ToString();
						while (strTemp.IndexOf("E") > 0)	// if in the form like 12E-9
						{
							dTemp *= 10;
							iMultiple *= 10;
							strTemp = dTemp.ToString();
						}
						var i = 0;
						while (strTemp[i] != '.')
							i++;
						var iDigitsAfterDecimal = strTemp.Length - i - 1;
						while (iDigitsAfterDecimal > 0)
						{
							dTemp *= 10;
							iMultiple *= 10;
							iDigitsAfterDecimal--;
						}
						frac = new Fraction((int)Math.Round(dTemp), iMultiple);
					}
					return frac;
				}
			}
			catch (OverflowException)
			{
				throw new FractionException("Conversion not possible due to overflow");
			}
			catch (Exception)
			{
				throw new FractionException("Conversion not possible");
			}
		}

		/// <summary>
		/// The function replicates current Fraction object
		/// </summary>
		public Fraction Duplicate()
		{
			var frac = new Fraction { Numerator = this.Numerator, Denominator = this.Denominator };
			return frac;
		}

		/// <summary>
		/// The function returns the inverse of a Fraction object
		/// </summary>
		public static Fraction Inverse(Fraction frac1)
		{
			if (frac1.Numerator == 0)
				throw new FractionException("Operation not possible (Denominator cannot be assigned a ZERO Value)");

			var iNumerator = frac1.Denominator;
			var iDenominator = frac1.Numerator;
			return (new Fraction(iNumerator, iDenominator));
		}
		#endregion



		#region **** Operators ****

		public static Fraction operator -(Fraction frac1)
		{ return (Negate(frac1)); }

		public static Fraction operator +(Fraction frac1, Fraction frac2)
		{ return (Add(frac1, frac2)); }

		public static Fraction operator +(int iNo, Fraction frac1)
		{ return (Add(frac1, new Fraction(iNo))); }

		public static Fraction operator +(Fraction frac1, int iNo)
		{ return (Add(frac1, new Fraction(iNo))); }

		public static Fraction operator +(double dbl, Fraction frac1)
		{ return (Add(frac1, Fraction.ToFraction(dbl))); }

		public static Fraction operator +(Fraction frac1, double dbl)
		{ return (Add(frac1, Fraction.ToFraction(dbl))); }

		public static Fraction operator -(Fraction frac1, Fraction frac2)
		{ return (Add(frac1, -frac2)); }

		public static Fraction operator -(int iNo, Fraction frac1)
		{ return (Add(-frac1, new Fraction(iNo))); }

		public static Fraction operator -(Fraction frac1, int iNo)
		{ return (Add(frac1, -(new Fraction(iNo)))); }

		public static Fraction operator -(double dbl, Fraction frac1)
		{ return (Add(-frac1, Fraction.ToFraction(dbl))); }

		public static Fraction operator -(Fraction frac1, double dbl)
		{ return (Add(frac1, -Fraction.ToFraction(dbl))); }

		public static Fraction operator *(Fraction frac1, Fraction frac2)
		{ return (Multiply(frac1, frac2)); }

		public static Fraction operator *(int iNo, Fraction frac1)
		{ return (Multiply(frac1, new Fraction(iNo))); }

		public static Fraction operator *(Fraction frac1, int iNo)
		{ return (Multiply(frac1, new Fraction(iNo))); }

		public static Fraction operator *(double dbl, Fraction frac1)
		{ return (Multiply(frac1, Fraction.ToFraction(dbl))); }

		public static Fraction operator *(Fraction frac1, double dbl)
		{ return (Multiply(frac1, Fraction.ToFraction(dbl))); }

		public static Fraction operator /(Fraction frac1, Fraction frac2)
		{ return (Multiply(frac1, Inverse(frac2))); }

		public static Fraction operator /(int iNo, Fraction frac1)
		{ return (Multiply(Inverse(frac1), new Fraction(iNo))); }

		public static Fraction operator /(Fraction frac1, int iNo)
		{ return (Multiply(frac1, Inverse(new Fraction(iNo)))); }

		public static Fraction operator /(double dbl, Fraction frac1)
		{ return (Multiply(Inverse(frac1), Fraction.ToFraction(dbl))); }

		public static Fraction operator /(Fraction frac1, double dbl)
		{ return (Multiply(frac1, Fraction.Inverse(Fraction.ToFraction(dbl)))); }

		public static bool operator ==(Fraction frac1, Fraction frac2)
		{ return frac1.Equals(frac2); }

		public static bool operator !=(Fraction frac1, Fraction frac2)
		{ return (!frac1.Equals(frac2)); }

		public static bool operator ==(Fraction frac1, int iNo)
		{ return frac1.Equals(new Fraction(iNo)); }

		public static bool operator !=(Fraction frac1, int iNo)
		{ return (!frac1.Equals(new Fraction(iNo))); }

		public static bool operator ==(Fraction frac1, double dbl)
		{ return frac1.Equals(new Fraction(dbl)); }

		public static bool operator !=(Fraction frac1, double dbl)
		{ return (!frac1.Equals(new Fraction(dbl))); }

		public static bool operator <(Fraction frac1, Fraction frac2)
		{ return frac1.Numerator * frac2.Denominator < frac2.Numerator * frac1.Denominator; }

		public static bool operator >(Fraction frac1, Fraction frac2)
		{ return frac1.Numerator * frac2.Denominator > frac2.Numerator * frac1.Denominator; }

		public static bool operator <=(Fraction frac1, Fraction frac2)
		{ return frac1.Numerator * frac2.Denominator <= frac2.Numerator * frac1.Denominator; }

		public static bool operator >=(Fraction frac1, Fraction frac2)
		{ return frac1.Numerator * frac2.Denominator >= frac2.Numerator * frac1.Denominator; }


		//Conversions
		public static implicit operator Fraction(long lNo)
		{ return new Fraction(lNo); }

		public static implicit operator Fraction(double dNo)
		{ return new Fraction(dNo); }

		public static implicit operator Fraction(string strNo)
		{ return new Fraction(strNo); }

		public static explicit operator double(Fraction frac)
		{ return frac.ToDouble(); }

		public static implicit operator string(Fraction frac)
		{ return frac.ToString(); }

		#endregion

		#region **** Operator methods ****

		/// <summary>
		/// internal function for negation
		/// </summary>
		private static Fraction Negate(Fraction frac1)
		{
			var iNumerator = -frac1.Numerator;
			var iDenominator = frac1.Denominator;
			return (new Fraction(iNumerator, iDenominator));

		}

		/// <summary>
		/// internal functions for binary operations
		/// </summary>
		private static Fraction Add(Fraction frac1, Fraction frac2)
		{
			try
			{
				checked
				{
					var iNumerator = frac1.Numerator * frac2.Denominator + frac2.Numerator * frac1.Denominator;
					var iDenominator = frac1.Denominator * frac2.Denominator;
					return (new Fraction(iNumerator, iDenominator));
				}
			}
			catch (OverflowException)
			{
				throw new FractionException("Overflow occurred while performing arithemetic operation");
			}
			catch (Exception)
			{
				throw new FractionException("An error occurred while performing arithemetic operation");
			}
		}

		private static Fraction Multiply(Fraction frac1, Fraction frac2)
		{
			try
			{
				checked
				{
					var iNumerator = frac1.Numerator * frac2.Numerator;
					var iDenominator = frac1.Denominator * frac2.Denominator;
					return (new Fraction(iNumerator, iDenominator));
				}
			}
			catch (OverflowException)
			{
				throw new FractionException("Overflow occurred while performing arithemetic operation");
			}
			catch (Exception)
			{
				throw new FractionException("An error occurred while performing arithemetic operation");
			}
		}

		/// <summary>
		/// The function returns GCD of two numbers (used for reducing a Fraction)
		/// </summary>
		private static long GCD(long iNo1, long iNo2)
		{
			// take absolute values
			if (iNo1 < 0)
				iNo1 = -iNo1;
			if (iNo2 < 0)
				iNo2 = -iNo2;

			do
			{
				if (iNo1 < iNo2)
				{
					var tmp = iNo1;  // swap the two operands
					iNo1 = iNo2;
					iNo2 = tmp;
				}
				iNo1 = iNo1 % iNo2;
			} while (iNo1 != 0);
			return iNo2;
		}

		/// <summary>
		/// The function reduces(simplifies) a Fraction object by dividing both its numerator 
		/// and denominator by their GCD
		/// </summary>
		public static void ReduceFraction(Fraction frac)
		{
			try
			{
				if (frac.Numerator == 0)
				{
					frac.Denominator = 1;
					return;
				}

				var iGCD = GCD(frac.Numerator, frac.Denominator);
				frac.Numerator /= iGCD;
				frac.Denominator /= iGCD;

				if (frac.Denominator < 0)	// if -ve sign in denominator
				{
					//pass -ve sign to numerator
					frac.Numerator *= -1;
					frac.Denominator *= -1;
				}
			} // end try
			catch (Exception exp)
			{
				throw new FractionException("Cannot reduce Fraction: " + exp.Message);
			}
		}

		#endregion



		/// <summary>
		/// checks whether two fractions are equal
		/// </summary>
		public override bool Equals(object obj)
		{
			var frac = (Fraction)obj;
			return (Numerator == frac.Numerator && Denominator == frac.Denominator);
		}

		/// <summary>
		/// returns a hash code for this fraction
		/// </summary>
		public override int GetHashCode()
		{
			return (Convert.ToInt32((Numerator ^ Denominator) & 0xFFFFFFFF));
		}

	}


	/// <summary>
	/// Exception class for Fraction, derived from System.Exception
	/// </summary>
	public class FractionException : Exception
	{
		public FractionException()
			: base()
		{ }

		public FractionException(string Message)
			: base(Message)
		{ }

		public FractionException(string Message, Exception InnerException)
			: base(Message, InnerException)
		{ }
	}	

}

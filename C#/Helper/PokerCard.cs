using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Helper
{
	class PokerCard
	{

		public PokerCard(int rank, SuitType suit)
		{
			Rank = rank;
			Suit = suit;
		}

		public PokerCard(string mark)
		{
			string firstpart, secondpart;
			switch (mark.Length)
			{
				case 2 :
					firstpart = mark[0].ToString();
					secondpart = mark[1].ToString();
					break;
				case 3 :
					firstpart = mark.Substring(0, 2);
					secondpart = mark[2].ToString();
					break;
				default :
					return;
			}


			//The rank
			int num;
			if (int.TryParse(firstpart, out num))
				Rank = num;
			else
				switch (firstpart)
				{
					case "J" :
						this.Rank = 11;
						break;
					case "Q" :
						this.Rank = 12;
						break;
					case "K" :
						this.Rank = 13;
						break;
					case "A" :
						this.Rank = 14;
						break;
					default:
						return;
				}

			//The suit
			switch (secondpart)
			{
				case "C":
					this.Suit = SuitType.Clubs;
					break;
				case "S":
					this.Suit = SuitType.Spades;
					break;
				case "H":
					this.Suit = SuitType.Hearts;
					break;
				case "D":
					this.Suit = SuitType.Diamonds;
					break;
				default:
					return;
			}

		}




		public int Rank { get; private set; }

		public enum SuitType { Clubs = 8, Spades = 4, Hearts = 2, Diamonds = 1}
		public SuitType Suit { get; private set; }


		#region Equality members

		protected bool Equals(PokerCard other)
		{
			return this.Rank == other.Rank && this.Suit == other.Suit;
		}

		/// <summary>
		/// Determines whether the specified <see cref="T:System.Object"/> is equal to the current <see cref="T:System.Object"/>.
		/// </summary>
		/// <returns>
		/// true if the specified object  is equal to the current object; otherwise, false.
		/// </returns>
		/// <param name="obj">The object to compare with the current object. </param>
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(null, obj))
				return false;
			if (ReferenceEquals(this, obj))
				return true;
			if (obj.GetType() != this.GetType())
				return false;
			return Equals((PokerCard)obj);
		}

		/// <summary>
		/// Serves as a hash function for a particular type. 
		/// </summary>
		/// <returns>
		/// A hash code for the current <see cref="T:System.Object"/>.
		/// </returns>
		public override int GetHashCode()
		{
			unchecked
			{
				return (this.Rank * 397) ^ (int)this.Suit;
			}
		}

		#endregion

		public static bool operator >(PokerCard pc1, PokerCard pc2)
		{
			if (pc1.Rank > pc2.Rank)
				return true;
			if (pc1.Rank == pc2.Rank)
				return (int)pc1.Suit > (int)pc2.Suit;

			return false;
		}

		public static bool operator ==(PokerCard pc1, PokerCard pc2)
		{
			return pc1.Equals(pc2);
		}

		public static bool operator !=(PokerCard pc1, PokerCard pc2)
		{
			return !(pc1 == pc2);
		}

		public static bool operator <(PokerCard pc1, PokerCard pc2)
		{
			return !(pc1 > pc2) && !(pc1 == pc2);
		}

		public static bool operator >=(PokerCard pc1, PokerCard pc2)
		{
			return (pc1 > pc2) || (pc1 == pc2);
		}

		public static bool operator <=(PokerCard pc1, PokerCard pc2)
		{
			return (pc1 < pc2) || (pc1 == pc2);
		}




		public override string ToString()
		{
			var r = Rank.ToString();
			switch (Rank)
			{
				case 11:
					r = "J";
					break;
				case 12:
					r = "Q";
					break;
				case 13:
					r = "T";
					break;
				case 14:
					r = "A";
					break;
			}

			var s = "";
			switch (Suit)
			{
				case SuitType.Clubs:
					s = "C";
					break;
				case SuitType.Spades:
					s = "S";
					break;
				case SuitType.Hearts:
					s = "H";
					break;
				case SuitType.Diamonds:
					s = "D";
					break;
			}


			return r + s;

		}
	}
}

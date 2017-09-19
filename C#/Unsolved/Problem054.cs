using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectEuler.Problems
{
	using ProjectEuler.Helper;

	internal class Problem054 : IProblem
	{

		public void CalculateSolution()
		{
			var lines = StartUp.GetFileContent("Problem054.txt");
			var wonnerinos = 0;

			foreach (var handstring in lines)
			{
				var hand1 = handstring.Split(' ')
				                      .Take(5)
				                      .Select(ss => new PokerCard(ss))
				                      .ToArray();
				var hand2 = handstring.Split(' ')
				                      .Skip(5)
				                      .Select(ss => new PokerCard(ss))
				                      .ToArray();

				if (GetWinner(hand1, hand2) == 1)
					wonnerinos++;
			}

			this.Solution = wonnerinos.ToString();
		}




		public int GetWinner(PokerCard[] hand1, PokerCard[] hand2)
		{
			var rank1 = GetPokerHandRank(hand1);
			var rank2 = GetPokerHandRank(hand2);

			if (rank1 > rank2)
				return 1;
			if (rank2 > rank1)
				return 2;

			//ranks are equal
			var sort1 = Sort(hand1).ToArray();
			var sort2 = Sort(hand2).ToArray();

			for (var card = 0; ; card++)
				if (sort1[card] > sort2[card])
					return 1;
				else if (sort2[card] > sort1[card])
					return 2;
		}




		private enum PokerHandRankType
		{
			HighCard,
			Pair,
			TwoPairs,
			ThreeOfAKind,
			Straight,
			Flush,
			FullHouse,
			FourOfAKind,
			StraightFlush,
			RoyalFlush
		}

		private PokerHandRankType GetPokerHandRank(PokerCard[] hand)
		{
			//Ranks and suits
			var ranks = PartitionByRank(hand);
			var suits = PartitionBySuit(hand);

			//Funcs
			var isStraight = (hand.Select(pc => pc.Rank)
										 .OrderBy(r => r)
										 .Select(r => r - hand.Min(pc => pc.Rank))
										 .SequenceEqual(new[] { 0, 1, 2, 3, 4 }));

			var isFlush = (suits.Count() == 1);

			Func<int, bool> hasNTuple = (n) => (ranks.Any(kvp => kvp.Value == n));



			//Royal flush
			if (isStraight && isFlush && hand.Min(pc => pc.Rank) == 10)
				return PokerHandRankType.RoyalFlush;

			//Straight flush
			if (isStraight && isFlush)
				return PokerHandRankType.StraightFlush;

			//Four of a kind
			if (hasNTuple(4))
				return PokerHandRankType.FourOfAKind;

			//FullHouse
			if (hasNTuple(3) && hasNTuple(2))
				return PokerHandRankType.FullHouse;

			//Flush
			if (isFlush)
				return PokerHandRankType.Flush;

			//Straight
			if (isStraight)
				return PokerHandRankType.Straight;

			//Three of a kind
			if (hasNTuple(3))
				return PokerHandRankType.ThreeOfAKind;

			//TwoPairs
			if (ranks.Count(kvp => kvp.Value == 2) == 2)
				return PokerHandRankType.TwoPairs;

			//Pair
			if (hasNTuple(2))
				return PokerHandRankType.Pair;


			return PokerHandRankType.HighCard;
		}

		private IEnumerable<PokerCard> Sort(PokerCard[] hand)
		{
			var rank = GetPokerHandRank(hand);

			var ranks = PartitionByRank(hand);

			switch (rank)
			{
				case PokerHandRankType.RoyalFlush:
				case PokerHandRankType.StraightFlush:
					return hand.OrderByDescending(pc => pc.Rank);
				case PokerHandRankType.FourOfAKind:
				case PokerHandRankType.ThreeOfAKind:
				case PokerHandRankType.Pair:
					var part1 = hand.Where(pc => ranks[pc.Rank] == 1)
					                .OrderByDescending(pc => pc.Rank)
					                .ThenByDescending(pc => pc.Suit);
					return part1.Concat(hand.Except(part1));
				case PokerHandRankType.FullHouse:
					var triple = hand.Where(pc => ranks[pc.Rank] == 3)
									 .OrderByDescending(pc => pc.Suit);
					var pair = hand.Where(pc => ranks[pc.Rank] == 2)
								   .OrderByDescending(pc => pc.Suit);
					return triple.Concat(pair);
				case PokerHandRankType.Flush:
				case PokerHandRankType.Straight:
					return hand.OrderByDescending(pc => pc.Rank);
				case PokerHandRankType.TwoPairs:
					var pairs = hand.Where(pc => ranks[pc.Rank] == 2)
					                .OrderByDescending(pc => pc.Rank)
									.ThenByDescending(pc => pc.Suit);
					return hand.Except(pairs)
					           .Concat(pairs);
				case PokerHandRankType.HighCard:
					return hand.OrderByDescending(pc => pc.Rank)
							   .ThenByDescending(pc => pc.Suit);
				default:
					return null;
			}
		}


		private Dictionary<int, int> PartitionByRank(PokerCard[] hand)
		{
			var ranks = hand.Select(pc => pc.Rank)
							.Distinct()
							.OrderBy(r => r);

			return ranks.ToDictionary(r => r, r => hand.Count(pc => pc.Rank == r));
		}

		private Dictionary<PokerCard.SuitType, int> PartitionBySuit(PokerCard[] hand)
		{
			var suits = hand.Select(pc => pc.Suit)
							.Distinct()
							.OrderBy(s => s);

			return suits.ToDictionary(s => s, s => hand.Count(pc => pc.Suit == s));
		}





		public string Solution { get; private set; }

		public string Hint { get; private set; }

	}
}

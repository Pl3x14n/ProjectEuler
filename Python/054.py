from itertools import groupby
from enum import IntEnum

class Rank(IntEnum):
	RoyalFlush = 10
	StraightFlush = 9
	FourOfAKind = 8
	FullHouse = 7
	Flush = 6
	Straight = 5
	ThreeOfAKind = 4
	TwoPairs = 3 
	Pair = 2
	High = 1 

	def __repr__(self):
		return str(self.name)


class Card:
	# J = 11, Q = 12, K = 13, A = 14
	# Cl = 1, Sp = 2, He = 3, Di = 4
	def __init__(self, v, s):
		self.value = v
		self.suit = s

	def __repr__(self):
		return str(self.value).replace("10", "T").replace("11", "J").replace("12", "Q").replace("13", "K").replace("14", "A") + "CSHD"[self.suit-1]


class Hand:
	def __init__(self, c):
		self.cards = c

	def get_rank(self):
		vals = [c.value for c in self.cards]
		suits = [c.suit for c in self.cards]

		straight = [v - min(vals) for v in sorted(vals)] == [0, 1, 2, 3, 4]
		flush = (len(set(suits)) == 1)

		cards = sorted(self.cards, key=lambda c: c.value)
		tuples = [(key, list(val)) for key, val in groupby(cards, key=lambda c: c.value)]
		foak = next(((k,v) for k,v in tuples if len(v) == 4), None)
		triple = next(((k,v) for k,v in tuples if len(v) == 3), None)
		pairs = sorted([(k,v) for k,v in tuples if len(v) == 2], key=lambda p: p[0], reverse=True)
		highs = sorted([(k,v) for k,v in tuples if len(v) == 1], key=lambda p: p[1][0].value * 4 + p[1][0].suit, reverse=True)



		if straight and flush:
			if min(vals) == 10:
				return [(Rank.RoyalFlush, 0)]
			else:
				return [(Rank.StraightFlush, min(vals))]
		elif straight:
			return [(Rank.Straight, min(vals))]
		elif flush:
			return [(Rank.Flush, 0)] + [(Rank.High, k) for k,v in highs]
		else:
			if foak is not None:
				return [(Rank.FourOfAKind, foak[0]), (Rank.High, highs[0][1])]
			elif triple is not None:
				if len(pairs) != 0:
					return [(Rank.FullHouse, triple[0])]
				else:
					return [(Rank.ThreeOfAKind, triple[0]), (Rank.High, highs[0][0]), (Rank.High, highs[1][0])]
			elif len(pairs) == 2:
				return [(Rank.TwoPairs, pairs[0][0]), (Rank.TwoPairs, pairs[1][0]), (Rank.High, highs[0][0])]
			elif len(pairs) == 1:
				return [(Rank.Pair, pairs[0][0]), (Rank.High, highs[0][0]), (Rank.High, highs[1][0]), (Rank.High, highs[2][0])]
			else:
				return [(Rank.High, k) for k,v in highs]


	def __repr__(self):
		s = ""
		for c in self.cards:
			s += str(c) + " "
		return s[:-1]




def string_to_hand(str):
	cards = str.split(" ")
	hand = []
	for c in cards:
		val = c[0].replace("T", "10").replace("J", "11").replace("Q", "12").replace("K", "13").replace("A", "14")
		suit = c[1].replace("C", "1").replace("S", "2").replace("H", "3").replace("D", "4")
		hand.append(Card(int(val), int(suit)))
	return Hand(hand)



def compare_hands(hand1, hand2):
	rank1 = hand1.get_rank()
	rank2 = hand2.get_rank()

	#print(f"Hand 1: {hand1}\t(Rank: )\t\t\tHand 2: {hand2}\t(Rank: )\t\t", end='')
	#print(f"{rank1[0]}\tvs.\t{rank2[0]}:\t", end='')

	for i in range(0, min(len(rank1), len(rank2))):
		curr1 = rank1[i]
		curr2 = rank2[i]

		if curr1[0] < curr2[0]:
			return 2
		elif curr1[0] > curr2[0]:
			return 1
		else:
			if curr1[1] < curr2[1]:
				return 2
			elif curr1[1] > curr2[1]:
				return 1
	
	return 0



games = [(l[0:14], l[15:]) for l in open("..\Inputs\Input054.txt", "r", encoding="utf-8-sig").read().split("\n")]

p1wins = 0
for i, game in enumerate(games):
	w = compare_hands(string_to_hand(game[0]), string_to_hand(game[1]))
	if w == 1:
		p1wins += 1
print(p1wins)
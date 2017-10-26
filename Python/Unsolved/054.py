class Card:
	# J = 11, Q = 12, K = 13, A = 14
	# Cl = 1, Sp = 2, He = 3, Di = 4
	def __init__(self, v, s):
		self.value = v
		self.suit = s

	def __repr__(self):
		return str(self.value) + str(self.suit)


class Hand:
	def __init__(self, c):
		self.cards = c

	def get_rank(self):
		vals = [c.value for c in self.cards]
		suits = [c.suit for c in self.cards]

		# Flush, Straight
		straight = [v - min(vals) for v in sorted(vals)] == [0, 1, 2, 3, 4]
		flush = (len(set(suits)) == 1)

		# Tuples
		

		
		return str(straight) + " " + str(flush) 





def string_to_hand(str):
	cards = str.split(" ")
	hand = []
	for c in cards:
		val = c[0].replace("T", "10").replace("J", "11").replace("Q", "12").replace("K", "13").replace("A", "14")
		suit = c[1].replace("C", "1").replace("S", "2").replace("H", "3").replace("D", "4")
		hand.append(Card(int(val), int(suit)))
	return Hand(hand)


s = "3D 4D 9D 6D 7D"
h = string_to_hand(s)
print(s)
print(h.get_rank())
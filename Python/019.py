days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

dotw = 2
ly = True
sundays = 0

for year in range(1901, 2001):
	ly = (year%4 == 0 and (year%100 != 0 or year%400 == 0))
	
	for month in range(1, 13):
		if (dotw == 0): 
			sundays += 1

		dotw = dotw + days[month-1]
		if month == 2 and ly: dotw += 1
		dotw %= 7

		
print(sundays)


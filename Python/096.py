# The sudokus are easy enough to try it with pure brute force
def solve(s):
	cells = [0] * 81
	row_marks = [set(range(1,10)) for r in range(9)]
	column_marks = [set(range(1,10)) for c in range(9)]
	box_marks = [set(range(1,10)) for b in range(9)]

	# Returns the row/col/box index
	def i2r(i): return i//9
	def i2c(i): return i % 9
	def i2b(i): return i // 27 * 3 + (i % 9) // 3


	# Backtracking method (i == curr cell index)
	def backtrack(i):
		if i == 81:
    		# Sudoku completed
			return True
		elif cells[i] != 0:
    		# Skip given numbers
			return backtrack(i+1)
		else:
    		# Get candidates of cell i
			available = row_marks[i2r(i)] & column_marks[i2c(i)] & box_marks[i2b(i)]

			# Empty cell with no candidates -> failure
			if len(available) == 0:
				return False

			# Brute force: try every candidate
			for mark in available:
    			# Set candidate
				cells[i] = mark
				row_marks[i2r(i)].remove(mark)
				column_marks[i2c(i)].remove(mark)
				box_marks[i2b(i)].remove(mark)

				# Stop if success
				if backtrack(i+1):
					return True

				# Undo
				row_marks[i2r(i)].add(mark)
				column_marks[i2c(i)].add(mark)
				box_marks[i2b(i)].add(mark)

			# Undo, failure, no candidate worked out
			cells[i] = 0
			return False


	# Prepping the sudoku
	for i, char in enumerate(s):
		cells[i] = int(char)
		if cells[i] != 0:
			row_marks[i2r(i)].remove(cells[i])
			column_marks[i2c(i)].remove(cells[i])
			box_marks[i2b(i)].remove(cells[i])


	# Try to solve
	if backtrack(0):
		return cells[:3]







# Load sudokus
path = r"..\Inputs\Input096.txt"
filecontent = open(path, "r").read()
sudoku_chrlen = len(filecontent) // 50 + 1

# Split sudoku file
sudokus = [filecontent[i:i+sudoku_chrlen] for i in range(0, len(filecontent), sudoku_chrlen)]
sudokus = [s[s.index("\n"):].replace("\n", "") for s in sudokus]


# Solve each of them 
solved = 0
sum = 0
for n in range(50):
	topleft = solve(sudokus[n])
	# print(n+1, "solved")
	sum += topleft[0]*100 + topleft[1]*10 + topleft[2]*1
	solved += 1


print(solved)
print(sum)



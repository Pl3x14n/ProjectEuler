content = open("..\In puts\Input067.txt", "r", encoding="utf-8-sig").read()
triangle = [[int(x) for x in line.split(" ")] for line in content.split("\n")]
triangle.sort(key=lambda r: len(r), reverse=True)


for ri, row in enumerate(triangle):
	if (ri == 0): continue
	for i, n in enumerate(row):
		triangle[ri][i] += max(triangle[ri-1][i], triangle[ri-1][i+1])

print(triangle[-1][0])		
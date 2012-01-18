#! /src/bin/python

import sys

i = 1
lines = []
for line in file(sys.argv[1]):
	lines.append(line)

lines.sort()

for line in lines:
	print "%3d: %s" % (i, line),
	i+= 1
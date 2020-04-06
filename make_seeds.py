#!/usr/bin/python3
import sys
import marshal

if len(sys.argv) != 2:
	print("[*] usage: ./make_seeds.py <seed directory>")
	exit(-1)

pardir = sys.argv[1]

fid = 0
for x in sys.modules:
	for y in sys.modules[x].__dict__:
		with open("%s/seed%d"%(pardir, fid), "wb") as f:
			try:
				marshal.dump(sys.modules[x].__dict__[y], f)
				fid += 1
			except ValueError:
				pass
			
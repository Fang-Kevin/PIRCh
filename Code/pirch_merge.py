#!/usr/bin/python
import sys
inputfile=sys.argv[1]
outfile=sys.argv[-1]
output = open(outfile,'w')

for line in open (inputfile):
    line=line.rstrip()
    data=line.split('\t')
    value=(float(data[3])+float(data[4]))/2
    #if float(data[4])<value:
     #   value=float(data[4])
    output.write("%s\t%s\t%s\t%.7f\n"%(data[0],data[1],data[2],value))
output.close()

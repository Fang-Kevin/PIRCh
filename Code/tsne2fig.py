import numpy as Math
import pylab as Plot
import seaborn as sns
import sys
infile=sys.argv[1]
labelfile=sys.argv[2]
figurefile=sys.argv[3]
data=Math.loadtxt(infile)
labels=Math.loadtxt(labelfile)
fig=Plot.scatter(data[:,0], data[:,1], 20, labels,cmap='nipy_spectral')
Plot.colorbar()
Plot.savefig(figurefile)

#!/usr/bin/python

import os
import re
import numpy as np
import pandas as pd
from mpi4py import MPI
gene=[]
name=[]
def mergeseq(seq,strand):
    a=[]
    for line in open(seq):
        if(re.match('>',line)):
            a.append("")
        else:
            a[-1]+=line.rstrip()
    if strand=="+":
        temp="".join(a)
    else:
        temp="".join(a[::-1])
    return temp

def makebed(genename):
    flag={}
    output=open(genename+".bed","w")
    for line in open("/home/fangjingwen/anno/mm9_with7sk_anno.txt"):
        data=line.rstrip().split()
        if(data[1]==genename):
            chr=data[2]
            strand=data[3]
            if(re.search(',$',data[9])):
                data[9]=data[9][:-1]
                data[10]=data[10][:-1]
            exonStart=map(int,data[9].split(','))
            exonEnd=map(int,data[10].split(','))
            for x in range(len(exonStart)):
                output.write("%s\t%s\t%s\t%s\t%s\n"%(data[2],exonStart[x],exonEnd[x],data[3],data[1]))
            if data[3]=='+':
                temp=0
                for x in range(len(exonStart)):
                    for y in range(exonStart[x],exonEnd[x]+1):
                        flag[temp]=y
                        temp+=1

            else :
                temp=0
                for x in range(len(exonStart))[::-1]:
                    for y in range(exonStart[x],exonEnd[x]+1)[::-1]:
                        flag[temp]=y
                        temp+=1
    output.close()
    os.popen('position2sequence.pl CAST ' + genename + '.bed ' + genename + '_CAST_sequence.temp')
    CAST=mergeseq(genename + '_CAST_sequence.temp',strand)
    os.popen('position2sequence.pl 129S1 ' + genename + '.bed ' + genename + '_129S1_sequence.temp')
    seq_129S1=mergeseq(genename + '_129S1_sequence.temp',strand)
    os.popen('position2sequence.pl mm9 ' + genename + '.bed ' + genename + '_mm9_sequence.temp')
    mm9=mergeseq(genename + '_mm9_sequence.temp',strand)
    SNP={}
    for i in range(len(CAST)):
        if CAST[i] !=seq_129S1[i]:
            if CAST[i]==mm9[i]:
                SNP[i]="129S1_SNP"
            elif seq_129S1[i]==mm9[i]:
                SNP[i]="CAST_SNP"
            else:
                SNP[i]="Bi_SNP"
    output=open(genename+"_SNP.temp","w")
    flag=pd.Series(flag)
    output.write(chr+"\t"+genename+"\t"+",".join(map(str,SNP.keys()))+"\t"+",".join(map(str,list(flag[SNP.keys()].values)))+"\t"+",".join(list(SNP.values()))+"\n")
    output.close()

    return flag[list(SNP.keys())],chr

def SNP_near_Counts(genename,bedfile,flag,chr):
    genome_pos=list(flag.values)
    temp={}
    for x in genome_pos:
        temp[x]=1
    relvent_pos=list(flag.keys())
    exp={}
    count={}
    output = open(genename+ '.rpkm_SNP.txt','w')
    output.write("name\tSNP_info")
    #output.write("name")
    for bed in bedfile:
        output.write("\t%s"%(bed))
    output.write("\n")

    for bed in bedfile:
        exp[bed]={}
        for line in open(bed):
            line=line.rstrip()
            data=line.split('\t')
            if data[0] == chr and float(data[3])>0:
                for i in range(int(data[1]),int(data[2])+1):
                    if temp.has_key(i):
                        exp[bed][i]=float(data[3])
    for x in range(len(genome_pos)):
        output.write(genename+'_'+str(relvent_pos[x])+'\t'+str(genome_pos[x]))
        for bed in bedfile:
            count[bed]=0
            if exp.has_key(bed):
                if exp[bed].has_key(genome_pos[x]):
                        count[bed]+=exp[bed][genome_pos[x]]
        for bed in bedfile:
            output.write("\t%.7f"%(count[bed]))
        output.write("\n")
    output.close()
    return


def single(rank):
    flag,chr=makebed(name[rank])
    return

for line in open("npc.txt"):
    name.append(line.rstrip())
ref="/home/fangjingwen/anno/mm9_with7sk_anno.txt"
read_dir_name = '/home/fangjingwen/Pirch/refine_npc/norm_bedGraph'
all_files = os.listdir(read_dir_name)
bedfile = [x for x in all_files if x[-8:]=='bedGraph']
bedfile.sort()
comm = MPI.COMM_WORLD
nsize = comm.Get_size()
rank = comm.Get_rank()
for x in range(int(len(name)/(nsize))+1):
    single(x*nsize + rank)

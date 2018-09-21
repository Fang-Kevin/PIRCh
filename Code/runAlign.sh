
# human ESC

tophat -p 8 -o H9.H3K4me1.rep1 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.H3K4me1.rep1.fastq
tophat -p 8 -o H9.H3K4me1.rep2 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.H3K4me1.rep2.fastq
tophat -p 8 -o H9.H3K4me3.rep1 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.H3K4me3.rep1.fastq
tophat -p 8 -o H9.H3K4me3.rep2 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.H3K4me3.rep2.fastq
tophat -p 8 -o H9.H3.rep1 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.H3.rep1.fastq
tophat -p 8 -o H9.H3.rep2 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.H3.rep2.fastq
tophat -p 8 -o H9.IgG.rep1 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.IgG.rep1.fastq
tophat -p 8 -o H9.IgG.rep2 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.IgG.rep2.fastq
tophat -p 8 -o H9.input.rep1 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.input.rep1.fastq
tophat -p 8 -o H9.input.rep2 /seq/bowtie-0.12.9/indexes/hg19 trim.pirch.H9.input.rep2.fastq
    
genomeCoverageBed -bg -split -ibam H9.H3K4me1.rep1/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.H3K4me1.rep1.bedGraph
genomeCoverageBed -bg -split -ibam H9.H3K4me1.rep2/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.H3K4me1.rep2.bedGraph
genomeCoverageBed -bg -split -ibam H9.H3K4me3.rep1/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.H3K4me3.rep1.bedGraph
genomeCoverageBed -bg -split -ibam H9.H3K4me3.rep2/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.H3K4me3.rep2.bedGraph
genomeCoverageBed -bg -split -ibam H9.H3.rep1/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.H3.rep1.bedGraph
genomeCoverageBed -bg -split -ibam H9.H3.rep2/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.H3.rep2.bedGraph
genomeCoverageBed -bg -split -ibam H9.IgG.rep1/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.IgG.rep1.bedGraph
genomeCoverageBed -bg -split -ibam H9.IgG.rep2/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.IgG.rep2.bedGraph
genomeCoverageBed -bg -split -ibam H9.input.rep1/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.input.rep1.bedGraph
genomeCoverageBed -bg -split -ibam H9.input.rep2/accepted_hits.bam -g /seq/chromosome/hg19/hg19.sizes > pirch.H9.input.rep2.bedGraph

bedGraphToBigWig pirch.H9.H3K4me1.rep1.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.H3K4me1.rep1.norm.bw
bedGraphToBigWig pirch.H9.H3K4me1.rep2.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.H3K4me1.rep2.norm.bw
bedGraphToBigWig pirch.H9.H3K4me3.rep1.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.H3K4me3.rep1.norm.bw
bedGraphToBigWig pirch.H9.H3K4me3.rep2.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.H3K4me3.rep2.norm.bw
bedGraphToBigWig pirch.H9.H3.rep1.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.H3.rep1.norm.bw
bedGraphToBigWig pirch.H9.H3.rep2.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.H3.rep2.norm.bw
bedGraphToBigWig pirch.H9.IgG.rep1.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.IgG.rep1.norm.bw
bedGraphToBigWig pirch.H9.IgG.rep2.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.IgG.rep2.norm.bw
bedGraphToBigWig pirch.H9.input.rep1.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.input.rep1.norm.bw
bedGraphToBigWig pirch.H9.input.rep2.norm.bedGraph /seq/chromosome/hg19/hg19.sizes pirch.H9.input.rep2.norm.bw

#Code to count the number of reads before and after bowtie2 alignment. Using Bio SeqIO, I am parsing the fastq files and running a for loop, counting the number of reads. With this function, I am running for each donor, one of the fastq files from the pair each. 

from Bio import SeqIO
import gzip

def countseqs(file_1, file_2, condition):
    before = 0 
    with open(file_1, "r") as handle:
        for read in SeqIO.parse(handle, "fastq"):
            before +=1

    after = 0 
    with gzip.open(file_2, "rt") as handle:
        for read in SeqIO.parse(handle, "fastq"):
            after +=1

    with open("./PipelineProject.log", 'a') as outfile:
        outfile.write(f"Donor {condition} had {before} read pairs before Bowtie2 filtering and {after} read pairs after.\n")

countseqs("./sequences/SRR5660030_1.fastq", "./step5_bowtie2/aligned_reads/SRR5660030_mapped_1.fastq.gz", "1 (2dpi)")
countseqs("./sequences/SRR5660033_1.fastq", "./step5_bowtie2/aligned_reads/SRR5660033_mapped_1.fastq.gz", "1 (6dpi)")
countseqs("./sequences/SRR5660044_1.fastq", "./step5_bowtie2/aligned_reads/SRR5660044_mapped_1.fastq.gz", "3 (2dpi)")
countseqs("./sequences/SRR5660045_1.fastq", "./step5_bowtie2/aligned_reads/SRR5660045_mapped_1.fastq.gz", "3 (6dpi)")

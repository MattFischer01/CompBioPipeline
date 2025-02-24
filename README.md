# Computational Biology 483 Python Pipeline Project
This pipeline project seeks to analyze Humn herpesvirus 5 (HCMV) transcriptomes 2- and 6-days post-infection (dpi) from two donors (Donor 1 and 3). 

The pipeline will run through the following steps on fastq files of the data:
1. Building a transcriptome index for HCMV (NCBI accession NC_006273.2) and extracting CDS features from the HCMV genome. 
2. Running kallisto on each sample (donor 1 and 3) and condition (2dpi and 6dpi) to quantify the TPM of each CDS.
3. Using the outputs from kallisto to run the R package sleuth to determine the differentially expressed genes between the two timepoints (2dpi and 6dpi), then filter the information for significant transcripts (FDR < 0.05)
4. Using Bowtie2, create a genome index for HCMV. Run bowtie2 on each sample and condition sequence pairs and save only the reads that map to the HCMB index. 
  - The genome index is already included in the github, but if you would like to run, the code is commented in ./step5_bowtie2/bowtie.sh
5. Using the output from step 4, run SPAdes to generate two assemblies, one from each sample (donor 1 and 3), using a kmer size of 77.
6. Extracting the longest contig generated in the output from SPAdes, creating a local database of sequences from the Betaherpesvirinae subfamily, and running blastn of the longest contig with the local database. 

## Running the wrapper code for the pipeline. 
You need to cd to PipelineProject_Matthew_Fischer then run the following code:
python wrapper.py

This will run the sample data included in the github and output information from each step into PipelineProject.log. If you want to run the full sample data, follow the below information under Retrieving Files (Step 1). 

Included in the github code is two other PipelineProject log files:
- PipelineProject_AllInput_MRF.log  - This includes the information from each step from the full datasets.
- PipelineProject_SampleOutput.log  - This is a reference log file that should be the same as what is written to PipelineProject.log running wrapper.py with the sample data.

## Retrieving Files (Step 1):
From the given websites, I went to the respective SRR link towards the bottom, clicked Data access tab, then used wget on the SRA Normalized link. Commands are as follows (ran in sequences folder):

#Donor 1 (2dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896360
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660030/SRR5660030

#Donor 1 (6dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896363
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660033/SRR5660033

#Donor 3 (2dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896374
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660044/SRR5660044

#Donor 3 (6dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896375
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660045/SRR5660045

Once I had the necessary files, I used fasterq-dump (in SRA-toolkit) to retrieve fastq files:
fasterq-dump ./SRR5660030
fasterq-dump ./SRR5660033
fasterq-dump ./SRR5660044
fasterq-dump ./SRR5660045

For the sample data I used unix command line to extract the first 40000 lines of each fastq files, which would be 10000 reads in total for each fastq. Example code: 
head -n 40000 input.fastq > output.fastq

## Command Line Tool Dependencies:
Blast+: https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html#downloadblastdata
NCBI Datasets: https://www.ncbi.nlm.nih.gov/datasets/docs/v2/command-line-tools/download-and-install/
SRA-Toolkit: https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump
SPAdes: https://github.com/ablab/spades
Bowtie2: https://bowtie-bio.sourceforge.net/bowtie2/index.shtml

## Python Dependencies:
Biopython: https://biopython.org/
Numpy (import numpy as np)
os (import os)

## R Libraries:
sleuth
data.table
dpylr

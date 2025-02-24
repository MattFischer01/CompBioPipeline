import os

#Make sure that the bash files are executable:
os.system("chmod +x ./step2_kallisto/retrieve_gff.sh ./step2_kallisto/run_kallisto.sh ./step3_quantify/quantification.sh ./step3_quantify/extract_tpm.sh ./step5_bowtie2/bowtie.sh ./step6_spades/runningspades.sh ./step7_blast/runblast.sh")

##Step 1: Retrieve Sample Data
#These files are already included in github, subsetted to 10000 reads from original fastq files. Reference retrievingseqs.sh for how to get the full sample data. 

##Step 2: Retrieve CDS features and Run Kallisto to get index. 
os.system("echo 'Step 2: Extract CDS' >> ./PipelineProject.log")

#First we need to extract the necessary files of NC_006273.2 to retrieve CDS features.
os.system("./step2_kallisto/retrieve_gff.sh")

#Extract CDS features. 
os.system("python ./step2_kallisto/extraction.py")

#Count the number of CDS features and write to log file.
os.system("python ./step2_kallisto/count_cds.py")

#Run Kalliso on CDS features 
os.system("./step2_kallisto/run_kallisto.sh")


##Step 3: Quantify the TPM of each CDS. 
os.system("echo 'Step 3: Quantify TPM of each sample' >> ./PipelineProject.log")

#Run Kallisto quant on each sample
os.system("./step3_quantify/quantification.sh")

#Extract the TPM column
os.system("./step3_quantify/extract_tpm.sh")

#Output results of TPM of each sample:
os.system("python ./step3_quantify/quantify_results.py")


##Step 4: Sleuth
os.system("echo '\nStep 4: Sleuth' >> ./PipelineProject.log")

#Run Sleuth
os.system("Rscript ./step4_sleuth/sleuth.R")


##Step 5: Running Bowtie
os.system("echo '\nStep 5: Running Bowtie' >> ./PipelineProject.log")

#Run bowtie:
os.system("./step5_bowtie2/bowtie.sh")

#Count the number of reads before and after bowtie2 alignment:
os.system("python ./step5_bowtie2/count_reads.py")


##Step 6: Running Spades 
os.system("echo '\nStep 6: Running SPAdes' >> ./PipelineProject.log")

os.system("./step6_spades/runningspades.sh")


#Step 7: Aligning longest contig length from output of SPAdes using blastn against Betaherpesvirinae subfamily
os.system("echo '\nStep 7: Running Blastn' >> ./PipelineProject.log")

#Extract the longest contig from output of SPAdes
os.system("python ./step7_blast/extractlongestcontig.py")

#Run blastn:
os.system("./step7_blast/runblast.sh")

#Done! 
#Running Spades for each donor:
echo "Running spades for Donor 1"
nohup spades.py -k 77 -t 2 --only-assembler --pe-1 1 ./step5_bowtie2/aligned_reads/SRR5660030_mapped_1.fastq.gz --pe-2 1 ./step5_bowtie2/aligned_reads/SRR5660030_mapped_2.fastq.gz --pe-1 2 ./step5_bowtie2/aligned_reads/SRR5660033_mapped_1.fastq.gz --pe-2 2 ./step5_bowtie2/aligned_reads/SRR5660033_mapped_2.fastq.gz -o ./step6_spades/output/donor1/ &

echo "Running spades for Donor 3"
nohup spades.py -k 77 -t 2 --only-assembler --pe-1 1 ./step5_bowtie2/aligned_reads/SRR5660044_mapped_1.fastq.gz --pe-2 1 ./step5_bowtie2/aligned_reads/SRR5660044_mapped_2.fastq.gz --pe-1 2 ./step5_bowtie2/aligned_reads/SRR5660045_mapped_1.fastq.gz --pe-2 2 ./step5_bowtie2/aligned_reads/SRR5660045_mapped_2.fastq.gz -o ./step6_spades/output/donor3/ &

wait 

echo "Processes are done"

#Writing out command lines to the log file.
echo "Command to run spades for donor 1:\nnohup spades.py -k 77 -t 2 --only-assembler --pe-1 1 ./step5_bowtie2/aligned_reads/SRR5660030_mapped_1.fastq.gz --pe-2 1 ./step5_bowtie2/aligned_reads/SRR5660030_mapped_2.fastq.gz --pe-1 2 ./step5_bowtie2/aligned_reads/SRR5660033_mapped_1.fastq.gz --pe-2 2 ./step5_bowtie2/aligned_reads/SRR5660033_mapped_2.fastq.gz -o ./step6_spades/output/donor1/ &\n" >> ./PipelineProject.log

echo "Command to run spades for donor 3:\nnohup spades.py -k 77 -t 2 --only-assembler --pe-1 1 ./step5_bowtie2/aligned_reads/SRR5660044_mapped_1.fastq.gz --pe-2 1 ./step5_bowtie2/aligned_reads/SRR5660044_mapped_2.fastq.gz --pe-1 2 ./step5_bowtie2/aligned_reads/SRR5660045_mapped_1.fastq.gz --pe-2 2 ./step5_bowtie2/aligned_reads/SRR5660045_mapped_2.fastq.gz -o ./step6_spades/output/donor3/ &\n" >> ./PipelineProject.log
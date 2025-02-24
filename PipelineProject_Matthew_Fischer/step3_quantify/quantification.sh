#Quantify the TPM of each CDS in each transcriptome using kallisto. 

#Running kallisto on Donor 1 2dpi
time kallisto quant -i ./step2_kallisto/hcmv_index.idx -o ./step3_quantify/results/SRR5660030 -b 30 -t 2 ./sequences/SRR5660030_1.fastq ./sequences/SRR5660030_2.fastq

#Running kallisto on Donor 1 6dpi
time kallisto quant -i ./step2_kallisto/hcmv_index.idx -o ./step3_quantify/results/SRR5660033 -b 30 -t 2 ./sequences/SRR5660033_1.fastq ./sequences/SRR5660033_2.fastq

#Running kallisto on Donor 3 2dpi
time kallisto quant -i ./step2_kallisto/hcmv_index.idx -o ./step3_quantify/results/SRR5660044 -b 30 -t 2 ./sequences/SRR5660044_1.fastq ./sequences/SRR5660044_2.fastq

#Running kallisto on Donor 3 6dpi
time kallisto quant -i ./step2_kallisto/hcmv_index.idx -o ./step3_quantify/results/SRR5660045 -b 30 -t 2 ./sequences/SRR5660045_1.fastq ./sequences/SRR5660045_2.fastq
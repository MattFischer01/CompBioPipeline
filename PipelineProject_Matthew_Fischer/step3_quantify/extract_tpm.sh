#From each Kallisto Quant results, I am extracting the TPM column (in the 5th column of abundance.tsv) necessary for the next step 
cut -f5 ./step3_quantify/results/SRR5660030/abundance.tsv > ./step3_quantify/results/SRR5660030/tpm.txt

cut -f5 ./step3_quantify/results/SRR5660033/abundance.tsv > ./step3_quantify/results/SRR5660033/tpm.txt

cut -f5 ./step3_quantify/results/SRR5660044/abundance.tsv > ./step3_quantify/results/SRR5660044/tpm.txt

cut -f5 ./step3_quantify/results/SRR5660045/abundance.tsv > ./step3_quantify/results/SRR5660045/tpm.txt

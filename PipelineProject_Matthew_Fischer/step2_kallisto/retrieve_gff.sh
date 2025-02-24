#Use ncbi tools to retrieve transcriptome for NCBI accession NC_006273.2
datasets download virus genome accession NC_006273.2 --filename ./step2_kallisto/data/ncbi_dataset.zip

unzip ./step2_kallisto/data/ncbi_dataset.zip -d ./step2_kallisto/data/

#Using esearch and efetch to get gff data format for extraction of CDS features. 
esearch -db nucleotide -query "NC_006273.2" | efetch -format gff > ./step2_kallisto/HCMV.gff

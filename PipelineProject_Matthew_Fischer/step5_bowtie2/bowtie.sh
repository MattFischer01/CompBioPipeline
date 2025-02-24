#building bowtie - Bowtie local database already built. 
#bowtie2-build ./step2_kallisto/data/ncbi_dataset/data/genomic.fna ./step5_bowtie2/genome_index/HCMV

nohup bowtie2 --quiet -x ./step5_bowtie2/genome_index/HCMV -1 ./sequences/SRR5660030_1.fastq -2 ./sequences/SRR5660030_2.fastq -S ./step5_bowtie2/aligned_reads/SRR5660030map.sam --al-conc-gz ./step5_bowtie2/aligned_reads/SRR5660030_mapped_%.fastq.gz &

nohup bowtie2 --quiet -x ./step5_bowtie2/genome_index/HCMV -1 ./sequences/SRR5660033_1.fastq -2 ./sequences/SRR5660033_2.fastq -S ./step5_bowtie2/aligned_reads/SRR5660033map.sam --al-conc-gz ./step5_bowtie2/aligned_reads/SRR5660033_mapped_%.fastq.gz &

nohup bowtie2 --quiet -x ./step5_bowtie2/genome_index/HCMV -1 ./sequences/SRR5660044_1.fastq -2 ./sequences/SRR5660044_2.fastq -S ./step5_bowtie2/aligned_reads/SRR5660044map.sam --al-conc-gz ./step5_bowtie2/aligned_reads/SRR5660044_mapped_%.fastq.gz &

nohup bowtie2 --quiet -x ./step5_bowtie2/genome_index/HCMV -1 ./sequences/SRR5660045_1.fastq -2 ./sequences/SRR5660045_2.fastq -S ./step5_bowtie2/aligned_reads/SRR5660045map.sam --al-conc-gz ./step5_bowtie2/aligned_reads/SRR5660045_mapped_%.fastq.gz &

wait
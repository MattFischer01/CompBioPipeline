#Step 7: code to blast search the longest contig of each donor from the results of step 6 SPades. Creating a local database to search my sequences against refsequences from Betaherpesvirinae subfamily (using datasets, makeblastdb, and blastn)

##Make Database
#get refseq sequences from the subfamily to make the necessary database 
datasets download virus genome taxon betaherpesvirinae --include genome --filename ./step7_blast/data/ncbi_dataset.zip

unzip ./step7_blast/data/ncbi_dataset.zip -d ./step7_blast/data/

#make a local database of the subfamily
makeblastdb -in ./step7_blast/data/ncbi_dataset/data/genomic.fna -out ./step7_blast/blastdb/betaherpesvirinae -title betaherpesvirinae -dbtype nucl

##BLASTN
#Run blastn for the longest contig length for donor 1. 
blastn -query ./step7_blast/donor1/don1longestcontig.fasta -db ./step7_blast/blastdb/betaherpesvirinae -out ./step7_blast/donor1/donor1results.tsv -outfmt "6 sacc pident length qstart qend sstart send bitscore evalue stitle" -max_hsps 1

#Run blastn for the longest contig length for donor 3. 
blastn -query ./step7_blast/donor3/don3longestcontig.fasta -db ./step7_blast/blastdb/betaherpesvirinae -out ./step7_blast/donor3/donor3results.tsv -outfmt "6 sacc pident length qstart qend sstart send bitscore evalue stitle" -max_hsps 1

##Write out the results to log file:
#Add header to log file.
echo "Donor 1 Blast Search:\nsacc\tpident\tlength\tqstart\tqend\tsstart\tsend\tbitscore\tevalue\tstitle" >> ./PipelineProject.log

#Adding blastn results to log file, only including top 10 hits. 
cat ./step7_blast/donor1/donor1results.tsv | head -10 >> ./PipelineProject.log

#Add header to log file.
echo "\nDonor 3 Blast Search:\nsacc\tpident\tlength\tqstart\tqend\tsstart\tsend\tbitscore\tevalue\tstitle" >> ./PipelineProject.log

#Adding blastn results to log file, only including top 10 hits. 
cat ./step7_blast/donor3/donor3results.tsv | head -10 >> ./PipelineProject.log


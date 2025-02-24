#Code to extract the longest contig from spades output, this is the first contig in scaffolds.fasta output, so this code is just extracting that first read using SeqIO.parse from Biopython.

from Bio import SeqIO

def extractfirst(file_1, file_2):
    handle = open(file_1)
    records = list(SeqIO.parse(handle,"fasta"))
    handle.close()
    with open(file_2, "w") as outfile:
        outfile.write(f">{records[0].id}\n{records[0].seq}")

extractfirst("./step6_spades/output/donor1/scaffolds.fasta", "./step7_blast/donor1/don1longestcontig.fasta")
extractfirst("./step6_spades/output/donor3/scaffolds.fasta", "./step7_blast/donor3/don3longestcontig.fasta")


#Code to extract CDS features from NC_006273.2

from Bio import SeqIO

#Path to gff file
infile = "./step2_kallisto/HCMV.gff"

#Output file 
output = "./step2_kallisto/HCMV_cds.fasta"

#Open output
with open(output, "w") as outfile:
    #Parse the gff file. 
    for record in SeqIO.parse(infile, "genbank"):
        for feature in record.features:
            if feature.type == "CDS":
                #Get the protein_id (RefSeq ID)
                protein_id = feature.qualifiers.get("protein_id", [""])[0]
                if protein_id:
                    #Get the CDS sequence
                    cds_sequence = feature.location.extract(record.seq)
                    #Write to FASTA format
                    outfile.write(f">{protein_id}\n{cds_sequence}\n")

print(f"CDS features extracted and saved to {output}")


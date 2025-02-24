#Code to count the number of CDS features using startswith > and a simple counter. 

infile = "./step2_kallisto/HCMV_cds.fasta"

logfile = "./PipelineProject.log"

cds_count = 0
with open(infile, "r") as infile:
    for line in infile:
        if line.startswith(">"):
            cds_count += 1

# Write to log file
with open(logfile, "a") as log:
    log.write(f"The HCMV genome (NC_006273.2) has {cds_count} CDS.\n\n")


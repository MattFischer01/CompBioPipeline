# Code to retieve input files. Run wget and faster1-dump in sequences folder.

#Donor 1 (2dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896360
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660030/SRR5660030

#Donor 1 (6dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896363
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660033/SRR5660033

#Donor 3 (2dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896374
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660044/SRR5660044

#Donor 3 (6dpi): https://www.ncbi.nlm.nih.gov/sra/SRX2896375
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR5660045/SRR5660045

fasterq-dump ./SRR5660030
fasterq-dump ./SRR5660033
fasterq-dump ./SRR5660044
fasterq-dump ./SRR5660045
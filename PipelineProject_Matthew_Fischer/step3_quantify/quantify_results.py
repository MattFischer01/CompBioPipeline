import numpy as np
import os

#Function that takes the subsetted TPM data from extract_tpm.sh, makes a list of the tpm numbers and uses numpy and base python to calculate median, mean, min, and max. Run the function for each sample

def tpm_results(file, logfile, sample, condition):
 
    with open(file, 'r') as tpm:
        header = tpm.readline().rstrip()
        values = [line.rstrip() for line in tpm.readlines()]
        values = [float(num) for num in values]
    tpm.close()

    median_val = np.median(values)
    mean_val = np.mean(values)
    min_val = min(values)
    max_val = max(values)

    with open(logfile, 'a') as log:
        log.write(f"{sample}\t{condition}\t{min_val}\t{median_val}\t{mean_val}\t{max_val}\n")

os.system("echo 'sample\tcondition\tmin_tpm\tmed_tpm\tmean_tpm\tmax_tpm' >> ./PipelineProject.log")
tpm_results("./step3_quantify/results/SRR5660030/tpm.txt", "./PipelineProject.log", "SRR5660030", "2dpi")
tpm_results("./step3_quantify/results/SRR5660033/tpm.txt", "./PipelineProject.log", "SRR5660033", "6dpi")
tpm_results("./step3_quantify/results/SRR5660044/tpm.txt", "./PipelineProject.log", "SRR5660044", "2dpi")
tpm_results("./step3_quantify/results/SRR5660045/tpm.txt", "./PipelineProject.log", "SRR5660045", "6dpi")

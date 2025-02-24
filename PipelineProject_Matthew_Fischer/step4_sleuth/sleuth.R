library(sleuth)
library(data.table)
library(dplyr)

stab = read.table("./step4_sleuth/sample_table.txt", header = T)

so = sleuth_prep(stab)

so = sleuth_fit(so, ~condition, 'full')
so = sleuth_fit(so, ~1, 'reduced')
so = sleuth_lrt(so, 'reduced', 'full')

sleuth_table = sleuth_results(so, 'reduced:full', 'lrt', show_all = F)

#Filters for FDR <= 0.05
sleuth_significant = dplyr::filter(sleuth_table, qval <= 0.05) |> dplyr::arrange(pval)

#Select only columns necessary for log file. 
subset = sleuth_significant %>% select(target_id,test_stat,pval,qval)

fwrite(sleuth_significant, file = "./step4_sleuth/fdr05_results.txt", quote = F, sep = '\t')

fwrite(subset, "./PipelineProject.log", sep = '\t', col.names =T,  append = T)

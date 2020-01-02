## code to prepare `DATASET` dataset goes here

usethis::use_data("DATASET")
setwd("E:\\Rpackage4\\package_new\\prioGene\\data-raw")
metabolic_net <- as.matrix(data.table::fread("geneSYMBOL-geneSYMBOL.txt", sep="\t", header=FALSE))
save(metabolic_net, file="metabolic_net.rda")

#MITOCHONDRIAL

#https://www.ensembl.org/biomart/martview/75987de7fa030cc3638d3b40e4ae5b96:
#37 genes
Exons<-read.table("~/CNVAnalisisDefinitivo/MitoRSoftware/RefHG38/mart_export(1).txt",
                  sep=",",
                  fill = TRUE,
                  header=TRUE)

#order to have the bed frame
Exons$chromosome<-"MT"
Exons <- subset(Exons, select=c(6,3,4,5))
colnames(Exons)[2:4]<-c("start", "end", "name")
Exons$name<-gsub("MT-", "", Exons$name)

saveRDS(Exons, "~/CNVAnalisisDefinitivo/Data-CNV/bedfileMito.RDS")

#d <- "https://ftp.ensembl.org/pub/release-86/gff3/homo_sapiens/"
#f <- "Homo_sapiens.GRCh38.86.chromosome.MT.gff3.gz"
#download.file(paste0(d, f), "mt_gff3.gz")
#gff.mito <- read.gff("mt_gff3.gz")
#gff.mito<-gff.mito[gff.mito$type == "exon"|gff.mito$type == "gene" ,]



#WHOLE HUMAN GENOME:
Conteos<- readRDS("~/CNVAnalisisDefinitivo/Data-CNV/Nueva_CNVDB.CLINICAL_MGEN_TWIST.RDS")
DB <- Conteos[["DB"]] #14 pacientes con 196 mil exones
colnames(DB)<- substr(colnames(DB),1,5)
colnames(DB)[10]<- "35252.1"
#DB<-DB[,-12]
Exons<-Conteos[["exons"]]

saveRDS(Exons, "~/CNVAnalisisDefinitivo/Data-CNV/bedfileHuman.RDS")





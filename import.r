
##Setup
###Packages


library(rmarkdown)
library(NanoStringNorm)




###Data Import
#We will look at our whole dataset: 108 RNA samples from 3 separate periods. 

###Raw

setwd("~/Documents/nstringnov17")

gm <- read.csv("gmark.csv")

setwd("~/Documents/nstringnov17/ctg5and6")
ct5and6.raw <- read.markup.RCC()


setwd("~/Documents/nstringnov17/ctg5hi")
ct5and6hi.raw <- read.markup.RCC()


setwd("~/Documents/nstringnov17/ctg7and8")
ct7and8.raw <- read.markup.RCC()


setwd("~/Documents/nstringnov17/ctg7and8hi")
ct7and8hi.raw <- read.markup.RCC()

setwd("~/Documents/nstringnov17/ctg3and4")

ct3and4.raw <- read.markup.RCC()


setwd("~/Documents/nstringnov17/ctg1and2")

ct1and2.raw <- read.markup.RCC()


setwd("~/Documents/nstringnov17/ctg9")

ct9.raw <- read.markup.RCC()



###Normalised fully


codeset <- read.table("CodeSet.txt")
codeset$shortname <- substr(codeset$Customer_Identifier, 1,2)
Cht <- read.table("CodeSetCountdata.txt")

ctg1and2.norm <- NanoStringNorm(x = ct1and2.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg3and4.norm <- NanoStringNorm(x = ct3and4.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg5and6.norm <- NanoStringNorm(x = ct5and6.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg5and6hi.norm <- NanoStringNorm(x = ct5and6hi.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg7and8.norm <- NanoStringNorm(x = ct7and8.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg7and8hi.norm <- NanoStringNorm(x = ct7and8hi.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);


ctg9.norm <- NanoStringNorm(x = ct9.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);





#Internal controls only


ctg5and6.intonly <- NanoStringNorm(x = ct5and6.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg5and6hi.intonly <- NanoStringNorm(x = ct5and6hi.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg7and8.intonly <- NanoStringNorm(x = ct7and8.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg7and8hi.intonly <- NanoStringNorm(x = ct7and8hi.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg3and4.intonly <- NanoStringNorm(x = ct3and4.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);


ctg1and2.intonly <- NanoStringNorm(x = ct1and2.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg9.intonly <- NanoStringNorm(x = ct9.raw, anno = NA, CodeCount ='sum', Background ="mean",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg1to9intonly <- cbind(ctg1and2.intonly,ctg3and4.intonly, ctg5and6hi.intonly, ctg7and8hi.intonly, ctg9.intonly)


ctg5and6.unnorm <- NanoStringNorm(x = ct5and6.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg5and6hi.unnorm <- NanoStringNorm(x = ct5and6hi.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg7and8.unnorm <- NanoStringNorm(x = ct7and8.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg7and8hi.unnorm <- NanoStringNorm(x = ct7and8hi.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg3and4.unnorm <- NanoStringNorm(x = ct3and4.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);


ctg1and2.unnorm <- NanoStringNorm(x = ct1and2.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg9.unnorm <- NanoStringNorm(x = ct9.raw, anno = NA, CodeCount ='none', Background ="none",OtherNorm = "none", round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = TRUE);

ctg1to9un <- cbind(ctg1and2.unnorm,ctg3and4.unnorm, ctg5and6hi.unnorm, ctg7and8hi.unnorm, ctg9.unnorm)


#Column data



colnames(ctg1and2.norm) <- c("C200", "C100", "C50", "C25", "C12", "C6", "CIA", "CIB", "FYA", "FOA", "MYA", "MOA","FYB",	"FOB",	"MYB",	"MOB",	"MOIA",	"MOIB","MOIC",	"MOID",	"CS1X",	"CS0.5X",	"CS0.25XA",	"CS0.25XB")
colnames(ctg1and2.unnorm) <- colnames(ctg1and2.norm) 

colnames(ctg3and4.norm) <- c("O1a", "O2a", "Y1a", "Y2a", "OR1a", "OR2a", "YR1a", "YR2a", "FY5a", "FY6a", "FO5a", "FO7a", "O1b", "O2b", "Y1b", "Y2b", "OR1b", "OR2b", "YR1b", "YR2b", "FY7", "FY8", "FO8", "FO9")
colnames(ctg3and4.unnorm) <- colnames(ctg3and4.norm) 

colnames(ctg5and6.norm) <- c("SFPA", "SFPB", "LFPA", "LFPB", "SMPA", "SMPB", "LMPA", "LMPB", "LMIA", "LMIB", "LMIC", "LMID", "Abef", "Aun", "Areg", "Bbef", "Bun", "Breg", "Cbef", "Cun", "Creg", "Dbef", "Dun", "Dreg")
colnames(ctg5and6.unnorm) <- colnames(ctg5and6.norm) 

colnames(ctg5and6hi.norm) <-  c("SFPA", "SFPB", "LFPA", "LFPB", "SMPA", "SMPB", "LMPA", "LMPB", "LMIA", "LMIB", "LMIC", "LMID", "Abef", "Aun", "Areg", "Bbef", "Bun", "Breg", "Cbef", "Cun", "Creg", "Dbef", "Dun", "Dreg")
colnames(ctg5and6hi.unnorm) <- colnames(ctg5and6hi.norm) 

colnames(ctg7and8.norm) <- c("SFPC","SFPD", "LFPC", "LFPD", "SMPC", "SMPD","LMPC", "LMPD", "0mPA", "0mPB", "10mPA", "20mPA", "Ebef", "Eun", "Ereg", "Fbef", "Fun", "Freg", "Gbef", "Gun", "Greg", "LFIA", "LFIB", "20mPB")
colnames(ctg7and8.unnorm) <- colnames(ctg7and8.norm) 

colnames(ctg7and8hi.norm) <-c("SFPC","SFPD", "LFPC", "LFPD", "SMPC", "SMPD","LMPC", "LMPD", "0mPA", "0mPB", "10mPA", "20mPA", "Ebef", "Eun", "Ereg", "Fbef", "Fun", "Freg", "Gbef", "Gun", "Greg", "LFIA", "LFIB", "20mPB")
colnames(ctg7and8hi.unnorm) <- colnames(ctg7and8hi.norm) 

colnames(ctg9.norm) <- c("LFIC", "LFID", "OmID", "10mIA", "n", "20mIC", "Ibef", "Iun", "Ireg", "Kbef", "Kun", "Kreg")
colnames(ctg9.unnorm) <- colnames(ctg9.norm) 

ctg3to9 <- cbind(ctg3and4.norm, ctg5and6hi.norm, ctg7and8hi.norm, ctg9.norm)

ctg1to9 <- cbind(ctg1and2.norm,ctg3and4.norm, ctg5and6hi.norm, ctg7and8hi.norm, ctg9.norm)

colnames(ctg1to9un) <- colnames(ctg1to9)

colnames(ctg1to9intonly) <- colnames(ctg1to9)
sampleinfo <- data.frame(
  
  sample=colnames(ctg1to9), 
  
  sex=c(rep("M", 8), rep(c("F", "F", "M", "M"), 2), rep("M", 8), rep("F", 28), rep("M", 8), rep("F", 16), rep("M", 4), rep("F", 28)), 
  
  age=c(rep("O",8), rep(c("Y","O","Y","O"),2),rep("O",8),  rep(c("O", "O", "Y", "Y", "O", "O", "Y", "Y","Y", "Y", "O", "O"), 2), c("Y", "Y", "O", "O", "Y", "Y", "O", "O", "O", "O", "O", "O", rep("O", 12)), c("Y", "Y", "O", "O", "Y", "Y", "O", "O", "N", "N", "N", "N"), rep("O", 11), c("N", "O", "O",  "N", "N", "N", "N", "O", "O", "O", "O", "O", "O")), 
  
  reg=c(rep("",24), rep(c(rep("", 4), rep("R", 4), rep("", 4)), 2), c(rep("", 12), rep(c("", "", "R"),4 )   ), c(rep("", 12), rep(c("", "", "R"),3 )   ), rep("",11 ), "R", "", "", "R") , 
  
  ctg=c(rep(1, 12), rep(2, 12),rep(3, 12), rep(4, 12), rep(5, 12), rep(6, 12), rep(7, 12), rep(8, 12), rep(9, 12)),
  
  size= c(rep("P",6), "I", "I", rep("P",8),rep("I",4), rep("I",4), rep("P", 32), rep("I", 4), rep("P",27), rep("I", 8), "P", rep("I", 4), rep("I", 8)), 
  
  moult = c(rep("", 80), 0,0,10,20,rep("", 11),20,"","", 0,10,"", 20,rep("", 6) ),
  
  exp= c(rep("conc",8), rep("OvY", 12), rep("cut", 4), rep("OvY",4), rep("regen", 4), rep("OvY",8), rep("regen", 4), rep("OvY",4), rep("OvY", 12), rep("regen", 12), rep("OvY", 8), rep("moult", 4),rep("regen", 9), "OvY", "OvY", "moult",  "OvY", "OvY", "moult", "moult", "moult", "moult", rep("regen", 6) ), 
  
  prep = c(rep("Luke", 24), rep("Nikos", 8), rep("Luke", 4), rep("Nikos", 8), rep("Luke", 4), rep("Luke", 60))
  
)


sampleinfo$flag <- FALSE
sampleinfo$flag[c(5,6,7,8,25,31,32, 54, 59, 66,67, 78,90, 97,101)] <- TRUE


#c(23,24,37,43,44, 54, 59, 66,67, 78,90, 97,101)

sampleinfo$type <- paste(sampleinfo$age, sampleinfo$reg, sep="")
sampleinfo$qual <- "ok"
sampleinfo$qual[c(25 , 31 , 32 , 49,  54 , 67  ,76,  90, 101, 104, 107)] <- "bad"
#sampleinfo$moult <- c(rep(NA, 80), 0,0,10,20,rep(NA, 11),20,NA,NA, 0,10,NA, 20,rep(NA, 6) )

#print("Samples as follows (all experiments)")
#print(paste("males: " sum()))



#Housekeeping genes 



ctg1and2.whk <- NanoStringNorm(x = ct1and2.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg1and2.whk.norm <- ctg1and2.whk$normalized.data
ctg1and2.whk.raw <- ctg1and2.whk$raw.data

ctg3and4.whk <- NanoStringNorm(x = ct3and4.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg3and4.whk.norm <- ctg3and4.whk$normalized.data
ctg3and4.whk.raw <- ctg3and4.whk$raw.data


ctg5and6.whk <- NanoStringNorm(x = ct5and6.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg5and6.whk.norm <- ctg5and6.whk$normalized.data
ctg5and6.whk.raw <- ctg5and6.whk$raw.data


ctg5and6hi.whk <- NanoStringNorm(x = ct5and6hi.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg5and6hi.whk.norm <- ctg5and6hi.whk$normalized.data
ctg5and6hi.whk.raw <- ctg5and6hi.whk$raw.data


ctg7and8.whk <- NanoStringNorm(x = ct7and8.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg7and8.whk.norm <- ctg7and8.whk$normalized.data
ctg7and8.whk.raw <- ctg7and8.whk$raw.data


ctg7and8hi.whk <- NanoStringNorm(x = ct7and8hi.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg7and8hi.whk.norm <- ctg7and8hi.whk$normalized.data
ctg7and8hi.whk.raw <- ctg7and8hi.whk$raw.data


ctg9.whk <- NanoStringNorm(x = ct9.raw, anno = NA, CodeCount ='sum', Background ="mean", SampleContent ='housekeeping.sum', round.values = FALSE, take.log = FALSE,return.matrix.of.endogenous.probes = FALSE);
ctg9.whk.norm <- ctg9.whk$normalized.data
ctg9.whk.raw <- ctg9.whk$raw.data

ctg1to9.whk.norm <- cbind(ctg1and2.whk.norm,ctg3and4.whk.norm[,4:27], ctg5and6hi.whk.norm[,4:27], ctg7and8hi.whk.norm[,4:27], ctg9.whk.norm[,4:15])

colnames(ctg1to9.whk.norm) <- c(colnames(ctg1and2.whk.norm[,1:3]), colnames(ctg1to9))

ctg1to9.whk.raw <- cbind(ctg1and2.whk.raw,ctg3and4.whk.raw[,4:27], ctg5and6hi.whk.raw[,4:27], ctg7and8hi.whk.raw[,4:27], ctg9.whk.raw[,4:15])

colnames(ctg1to9.whk.raw) <- c(colnames(ctg1and2.whk.raw[,1:3]), colnames(ctg1to9))

hk.norm <- subset(ctg1to9.whk.norm, ctg1to9.whk.norm[,1] == "Housekeeping")

hk.raw <- subset(ctg1to9.whk.raw, ctg1to9.whk.raw[,1] == "Housekeeping")


geneinf <- data.frame(name=codeset$Customer_Identifier,transl2fc=codeset$log2FoldChange,  dir = ifelse(codeset$log2FoldChange> 0, "downregulated with age", "upregulated with age"))

geneinf$in61 <- geneinf$name %in% gm$marker[gm$dir != "housekeeping"]



##Saving
save(sampleinfo,ctg1to9,ctg1to9intonly,ctg1to9un, codeset,geneinf, hk.norm, hk.raw, file="nov17main_data.rdata")




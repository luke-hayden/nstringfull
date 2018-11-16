library(dplyr)
library(tibble)
library(tidyr)
library(caret)
library(gtools)
library(FinCal)
library(doParallel)




#setwd("~/Documents/nstringjul18")
load(file="allns_data.rdata")
load("modelgbm.rdata")
load("models.rdata")
load("vardat.rdata")
load(file="markerchoiceinfo.rdata")

cl <- makePSOCKcluster(7)
registerDoParallel(cl)


md <- as.data.frame(subset(t(ctall.norm), sampleinfo$sex == "F" &
                             sampleinfo$prep== "Luke"&
                             sampleinfo$exp %in% c("Size-age", "cohorts", "OvY") &
                             sampleinfo$codeset == "phaw_1" &
                             sampleinfo$type %in% c("O", "Y", "M")
))

md <- subset(md, rownames(md)%in% qualsum$sample[qualsum$good])

md <- md[, colnames(md) %in% c(minf$name[minf$in61==T], "predage")]

md$sample <- rownames(md)

md <- left_join(md, select(sampleinfo, sample, predage), by="sample") %>%
  filter(!(is.na(predage))) %>%
  column_to_rownames(var="sample")


trainchoice <- sample(1:nrow(md))[1:floor(4*(nrow(md)/5))]


trainchoice <- rownames(md) %in% rownames(currbest$trainingData)
trdat <- md[trainchoice,]
tedat <- md[-trainchoice,]


gbmagemodelbig <- train(
  predage~.,
  tuneLength = 4,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*100, 
                       interaction.depth = c(1,2,3,4,5), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1) ,
                       n.minobsinnode = c(2,3,4,5,6,7)),
  trControl =  trainControl(method = 'cv', 
                            number = 50, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

stopCluster(cl)

save(gbmagemodelbig, file="gbmbig.rdata")
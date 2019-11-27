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

md <- md[, lmdf2$in61 ==T & lmdf2$pvalovy < 0.05]

md <- md[, colnames(md) %in% c(minf$name[minf$in61==T], "predage")]

md$sample <- rownames(md)

md <- left_join(md, select(sampleinfo, sample, predage), by="sample") %>%
  filter(!(is.na(predage))) %>%
  column_to_rownames(var="sample")


trainchoice <- sample(1:nrow(md))[1:floor(4*(nrow(md)/5))]


trainchoice <- rownames(md) %in% rownames(currbest$trainingData)
trdat <- md[trainchoice,]
tedat <- md[-trainchoice,]


gbmagemodelp5 <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*200, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 10, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

md <- as.data.frame(subset(t(ctall.norm), sampleinfo$sex == "F" &
                             sampleinfo$prep== "Luke"&
                             sampleinfo$exp %in% c("Size-age", "cohorts", "OvY") &
                             sampleinfo$codeset == "phaw_1" &
                             sampleinfo$type %in% c("O", "Y", "M")
))

md <- subset(md, rownames(md)%in% qualsum$sample[qualsum$good])

md <- md[, lmdf2$in61 ==T & lmdf2$pvalovy < 0.04]

md <- md[, colnames(md) %in% c(minf$name[minf$in61==T], "predage")]

md$sample <- rownames(md)

md <- left_join(md, select(sampleinfo, sample, predage), by="sample") %>%
  filter(!(is.na(predage))) %>%
  column_to_rownames(var="sample")


trainchoice <- sample(1:nrow(md))[1:floor(4*(nrow(md)/5))]


trainchoice <- rownames(md) %in% rownames(currbest$trainingData)
trdat <- md[trainchoice,]
tedat <- md[-trainchoice,]


gbmagemodelp4 <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*200, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 10, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)


md <- as.data.frame(subset(t(ctall.norm), sampleinfo$sex == "F" &
                             sampleinfo$prep== "Luke"&
                             sampleinfo$exp %in% c("Size-age", "cohorts", "OvY") &
                             sampleinfo$codeset == "phaw_1" &
                             sampleinfo$type %in% c("O", "Y", "M")
))

md <- subset(md, rownames(md)%in% qualsum$sample[qualsum$good])

md <- md[, lmdf2$in61 ==T & lmdf2$pvalovy < 0.03]

md <- md[, colnames(md) %in% c(minf$name[minf$in61==T], "predage")]

md$sample <- rownames(md)

md <- left_join(md, select(sampleinfo, sample, predage), by="sample") %>%
  filter(!(is.na(predage))) %>%
  column_to_rownames(var="sample")


trainchoice <- sample(1:nrow(md))[1:floor(4*(nrow(md)/5))]


trainchoice <- rownames(md) %in% rownames(currbest$trainingData)
trdat <- md[trainchoice,]
tedat <- md[-trainchoice,]


gbmagemodelp3 <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*200, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 10, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

md <- as.data.frame(subset(t(ctall.norm), sampleinfo$sex == "F" &
                             sampleinfo$prep== "Luke"&
                             sampleinfo$exp %in% c("Size-age", "cohorts", "OvY") &
                             sampleinfo$codeset == "phaw_1" &
                             sampleinfo$type %in% c("O", "Y", "M")
))

md <- subset(md, rownames(md)%in% qualsum$sample[qualsum$good])

md <- md[, lmdf2$in61 ==T & lmdf2$pvalovy < 0.02]

md <- md[, colnames(md) %in% c(minf$name[minf$in61==T], "predage")]

md$sample <- rownames(md)

md <- left_join(md, select(sampleinfo, sample, predage), by="sample") %>%
  filter(!(is.na(predage))) %>%
  column_to_rownames(var="sample")


trainchoice <- sample(1:nrow(md))[1:floor(4*(nrow(md)/5))]


trainchoice <- rownames(md) %in% rownames(currbest$trainingData)
trdat <- md[trainchoice,]
tedat <- md[-trainchoice,]


gbmagemodelp2 <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*200, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 10, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

md <- as.data.frame(subset(t(ctall.norm), sampleinfo$sex == "F" &
                             sampleinfo$prep== "Luke"&
                             sampleinfo$exp %in% c("Size-age", "cohorts", "OvY") &
                             sampleinfo$codeset == "phaw_1" &
                             sampleinfo$type %in% c("O", "Y", "M")
))

md <- subset(md, rownames(md)%in% qualsum$sample[qualsum$good])

md <- md[, lmdf2$in61 ==T & lmdf2$pvalovy < 0.01]

md <- md[, colnames(md) %in% c(minf$name[minf$in61==T], "predage")]

md$sample <- rownames(md)

md <- left_join(md, select(sampleinfo, sample, predage), by="sample") %>%
  filter(!(is.na(predage))) %>%
  column_to_rownames(var="sample")


trainchoice <- sample(1:nrow(md))[1:floor(4*(nrow(md)/5))]


trainchoice <- rownames(md) %in% rownames(currbest$trainingData)
trdat <- md[trainchoice,]
tedat <- md[-trainchoice,]


gbmagemodelp1 <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*200, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 10, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

gbmagemodelp1b <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*500, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 10, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

gbmagemodelp1c <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*500, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 20, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

gbmagemodelp1d <- train(
  predage~.,
  tuneLength = 5,
  data = trdat, 
  method = "gbm",
  tuneGrid=expand.grid(n.trees = (0:50)*500, 
                       interaction.depth = c(1,2,3,4,5,6,7,8,9,10), 
                       shrinkage = c(0.0001,.001, 0.01, 0.1, 0.2, 0.3) ,
                       n.minobsinnode = c(2,3,4,5,6,7,8,9,10)),
  trControl =  trainControl(method = 'cv', 
                            number = 40, 
                            summaryFunction=defaultSummary, 
                            verboseIter = T)
)

stopCluster(cl)

save(gbmagemodelp5, gbmagemodelp4, gbmagemodelp3, gbmagemodelp2, gbmagemodelp1, gbmagemodelp1b, gbmagemodelp1c, gbmagemodelp1d, file="gbmbig2.rdata")
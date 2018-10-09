

library(NanoStringNorm)
library(dplyr)
library(ggbiplot)
library(tibble)
library(tidyr)
library(lubridate)


dirstart <-"~/nstringjul18/nstringfull/"


setwd(paste0(dirstart, "1011"))
ct1011.raw <- read.markup.RCC()


setwd(paste0(dirstart, "1213"))
ct1213.raw <- read.markup.RCC()


setwd(paste0(dirstart, "14"))
ct14.raw <- read.markup.RCC()


setwd(paste0(dirstart, "15"))
ct15.raw <- read.markup.RCC()



setwd(paste0(dirstart, "ctg5and6"))
ct5and6.raw <- read.markup.RCC()



setwd(paste0(dirstart, "ctg5hi"))
ct5and6hi.raw <- read.markup.RCC()


setwd(paste0(dirstart, "ctg7and8"))
ct7and8.raw <- read.markup.RCC()



setwd(paste0(dirstart, "ctg7and8hi"))
ct7and8hi.raw <- read.markup.RCC()


setwd(paste0(dirstart, "ctg3and4"))

ct3and4.raw <- read.markup.RCC()



setwd(paste0(dirstart, "ctg1and2"))

ct1and2.raw <- read.markup.RCC()



setwd(paste0(dirstart, "ctg9"))

ct9.raw <- read.markup.RCC()








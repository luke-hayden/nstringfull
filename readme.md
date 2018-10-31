# ReAGE prject main data analysis and modelling

Analysis of four Nanostring datasets from:
Oct 2016
Feb 2017
Nov 2017
July 2018

Goals:
-Using Nanostring gene expression data, build machine learning models to predict sample biological age from gene expression. Measure the effect of regeneration on this molcular age. 

### Prerequisites

All analysis was performed in RStudio Version 1.0.136, running R version 3.x. 
Packages needed are:

ggplot2
rmarkdown
gplots
RColorBrewer
reshape2
scales
ggbiplot
devtools
NanoStringNorm
gtools
knitr
dplyr
tidyr
e1071
caTools
FinCal
ggrepel

Exact prerequisites depend on script in question. 


### Structure
The following functions are carried out by the following scripts:
All analyses are carried out in notebooks (Rmarkdown format), with visualisation & graphics within

Inputs: 
Large set of Nanostring data in .RCC format. 
siall.csv: info on samples
zk-age-len.csv: extra age-length data

-imp1.r,import.rmd: Parse .rcc files and produce output in readable format 
      output: all_ns_data.rdata, sampleinfo.rdata
      
-age-len.rmd: model age-body length relationship 
    input: sampleinfo.rdata
    output: modified sampleinfo.rdata

-agesep.rmd: patterns of variation old v young
    input: sampleinfo.rdata, allns_data.rdata
    output: vardat.rdata

-qual.rmd: rate sample quality, impose cutoff to separate good from bad
    input: sampleinfo.rdata, allns_data.rdata
    output: qualitydat.rdata
    
-rfopt.rmd: optimise random forest models 
    input: sampleinfo.rdata, allns_data.rdata, qualdat.rdata, vardat.rdata, modelrf.rdata (recursive optimisation)
    output: modelrf.rdata

-gbmopt.rmd: optimise GBM models 
    input: sampleinfo.rdata, allns_data.rdata, qualdat.rdata, vardat.rdata, modelrf.rdata,  modelgbm.rdata (recursive optimisation)
    output: modelgbm.rdata
    

-regeff.rmd:examine effect of regeneration on age predicted by models
    input: sampleinfo.rdata, allns_data.rdata, qualdat.rdata, vardat.rdata, modelrf.rdata,  modelgbm.rdata 

All raw data is held in folders with .rcc files 


## Samples

July 2018
72 samples total, including: 
Old and young female pools (sized)
Old and young female individuals (sized)
Cohorts of known biologica ages and body lengths
Regeneration experiment sets: each pool individual has two samples taken:
Left T4 & T5 limbs at t30, after regeneration (reg)
Right T4 &T5 limbs at t30 (un)

Nov 2017:
59 samples in total, including: 
Old and young male and female pools
Old male and female individuals
Females at 0, 10 and 20 days after moulting, pools and individuals
Regeneration experiment sets: each pool individual has three samples taken:
Left T4 & T5 limbs at t0 (bef)
Left T4 & T5 limbs at t30, after regeneration (reg)
Right T4 &T5 limbs at t30 (un)

Feb 2017:
24 samples in total

Oct 2016:
24 samples in total

## Repository

[https://github.com/luke-hayden/nstringfull]

## Authors

* **Luke Hayden** 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Marie Semon & Michalis Averof for advice
* Paola Oliveri



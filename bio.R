setwd("D:/METOPEL UAS/KRISNA METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("bio.xlsx")
dat <- read_excel("bio.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(sawit~bio,data=dat)
summary(reg1)

# Plot 
plot(dat$tahun,dat$sawit,xlab="Ekspor Bio Diesel",ylab="Ekspor Minyak Sawit")
plot(dat$tahun,dat$bio,xlab="Tahun",ylab="Ekspo Bio Diesel")

# Plot Error
dat$m<-resid(reg1)
plot(dat$sawit,dat$m,xlab="Ekspor Minyak Sawit",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$bio,dat$m,xlab="Ekspor Bio Diesel",ylab="error")
abline(h=0)


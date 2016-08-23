# Exploratory analysis
# files downloaded from https://cepa.stanford.edu/seda/ on 2016-08-23

# load files ####

# load libraries 
library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)

# load data 
dist_covar <- read_csv("data/dist_covariates_1pt1.csv")
dist_means <- read_csv("data/dist_means_1pt1.csv")

# clean data ####

# filter for ky
ky_covar <- dist_covar %>% 
  filter(stateabb == "KY")

ky_means <- dist_means %>%
  filter(stateabb == "KY")

# join means and covariates
ky_data <- ky_means %>%
  left_join(ky_covar, by = c( "leaname", "fips", "stateabb", "year"))


# exploratory plots ####
ggplot(ky_covar, aes( x = year, y = aides/tottch, group = leaid))+
  geom_line()+
  facet_wrap(~cdcode)


ggplot(ky_covar, aes( x = year, y = flunch_all, group = leaid))+
  geom_line()+
  facet_wrap(~cdcode)


ggplot(ky_data, aes( x = year, y = mean_edfa_math, group = leaname))+
  geom_line()+
  facet_grid(cdcode~grade)
# download_experiment_data.R
# Downloads the three real experiment datasets used in Parts B-D of the
# Week 9 activity (from the data files for "Quantitative Social Science" by
# Imai) and saves them under the file names the notebook expects.

setwd("/Users/mikelson/Local-GitHub/PS3-FA26/Week9-Section/activity")

base <- "https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/"

download.file(paste0(base, "resume.csv"), "ps3_resume.csv")
download.file(paste0(base, "social.csv"), "ps3_social_pressure.csv")
download.file(paste0(base, "STAR.csv"),   "ps3_star.csv")

# Quick checks: these should run without errors
library(estimatr)
resume <- read.csv("ps3_resume.csv")
social <- read.csv("ps3_social_pressure.csv")
star   <- read.csv("ps3_star.csv")
difference_in_means(call ~ race, data = resume, condition1 = "white", condition2 = "black")
difference_in_means(primary2006 ~ messages, data = social, condition1 = "Control", condition2 = "Neighbors")
difference_in_means(g4math ~ classtype, data = star, condition1 = 2, condition2 = 1)

# PS 3 Final Exam Study Guide: code for every figure
#
# Run this whole file in R. It downloads or loads all of the (real) data, and prints
# the output for each figure. Screenshot each printed output (see SCREENSHOT_CHECKLIST.md)
# and save it in the folder reference-images using the file name given in the comment above
# the code. The two plots are saved automatically.

## Setup
#install.packages("estimatr")
library(estimatr)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("wooldridge")
library(wooldridge)
#install.packages("rdrobust")
library(rdrobust)
#install.packages("stargazer")
library(stargazer)
options(warn = -1)

# Folder where the plots get saved
dir.create("reference-images", showWarnings = FALSE)

## Real data, downloaded from the internet or loaded from R packages
social <- read.csv("https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/social.csv")
resume <- read.csv("https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/resume.csv")
minwage <- read.csv("https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/minwage.csv")
data("rdrobust_RDsenate")
senate <- rdrobust_RDsenate
# vote1 comes with the wooldridge package

## Small data prep used by later cells
minwage$state <- ifelse(minwage$location == "PA", "PA", "NJ")
minwage$full_change <- minwage$fullAfter - minwage$fullBefore
senate$dem_won <- ifelse(senate$margin > 0, 1, 0)
voted.2004 <- subset(social, primary2004 == 1)
did.not.vote.2004 <- subset(social, primary2004 == 0)
close.races <- subset(senate, abs(margin) < 2)

## Figure 1: save as reference-images/final-fig01-social-balance.png
table(social$messages, social$sex)

## Figure 2: save as reference-images/final-fig02-resume-table.png
table(resume$race, resume$call)

## Figure 3: save as reference-images/final-fig03-resume-dim.png
difference_in_means(call ~ race, resume, condition1 = 'black', condition2 = 'white')

## Figure 4: save as reference-images/final-fig04-hawthorne-vs-civic.png
difference_in_means(primary2006 ~ messages, social, condition1 = 'Civic Duty', condition2 = 'Hawthorne')

## Figure 5: save as reference-images/final-fig05-neighbors-vs-control.png
difference_in_means(primary2006 ~ messages, social, condition1 = 'Control', condition2 = 'Neighbors')

## Figure 6: save as reference-images/final-fig06-hte-voted-2004.png
difference_in_means(primary2006 ~ messages, voted.2004, condition1 = 'Control', condition2 = 'Neighbors')

## Figure 7: save as reference-images/final-fig07-hte-did-not-vote-2004.png
difference_in_means(primary2006 ~ messages, did.not.vote.2004, condition1 = 'Control', condition2 = 'Neighbors')

## Figure 8: save as reference-images/final-fig08-sex-difference-2004.png
difference_in_means(primary2004 ~ sex, social, condition1 = 'female', condition2 = 'male')

## Figure 9: save as reference-images/final-fig09-spending-scatter.png
## (this plot is saved automatically; no screenshot needed)
spending.plot <- qplot(expendA, voteA, data = vote1) + geom_smooth(method = 'lm', formula = y ~ x)
ggsave('reference-images/final-fig09-spending-scatter.png', spending.plot, width = 6, height = 4, dpi = 200)
print(spending.plot)

## Figure 10: save as reference-images/final-fig10-lm-bivariate.png
summary(lm(voteA ~ expendA, data = vote1))

## Figure 11: save as reference-images/final-fig11-lm-multivariate.png
summary(lm(voteA ~ expendA + expendB + prtystrA, data = vote1))

## Figure 12: save as reference-images/final-fig12-lm-experiment.png
summary(lm(primary2006 ~ messages, data = social))

## Figure 13: save as reference-images/final-fig13-table-observational.png
model.1 <- lm(voteA ~ expendA, data = vote1)
model.2 <- lm(voteA ~ expendA + prtystrA, data = vote1)
model.3 <- lm(voteA ~ expendA + expendB + prtystrA, data = vote1)
stargazer(model.1, model.2, model.3, type = 'text')

## Figure 14: save as reference-images/final-fig14-table-experimental.png
experiment.1 <- lm(primary2006 ~ messages, data = social)
experiment.2 <- lm(primary2006 ~ messages + sex + yearofbirth + primary2004 + hhsize, data = social)
stargazer(experiment.1, experiment.2, type = 'text')

## Figure 15: save as reference-images/final-fig15-rdd-plot.png
## (this plot is saved automatically; no screenshot needed)
rdd.plot <- qplot(margin, vote, data = subset(senate, abs(margin) < 25)) + geom_smooth(aes(group = dem_won), method = 'lm', formula = y ~ x) + geom_vline(xintercept = 0, linetype = 'dashed')
ggsave('reference-images/final-fig15-rdd-plot.png', rdd.plot, width = 6, height = 4, dpi = 200)
print(rdd.plot)

## Figure 16: save as reference-images/final-fig16-rdd-dim.png
difference_in_means(vote ~ dem_won, close.races, condition1 = 0, condition2 = 1)

## Figure 17: save as reference-images/final-fig17-did-means.png
aggregate(cbind(fullBefore, fullAfter) ~ state, data = minwage, FUN = mean)

## Figure 18: save as reference-images/final-fig18-did-dim.png
difference_in_means(full_change ~ state, minwage, condition1 = 'PA', condition2 = 'NJ')

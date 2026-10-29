## Week 12 activity: cleaning the Ofosu (2019) replication data
## Run this in a folder that contains these three files from the Dataverse replication package:
##   gko_cdf_spending_data10162017.csv
##   gko_electoral_competition.csv
##   gko_mpabsence_data.csv
## (if your downloaded copies end in "-2", change the file names below)
## Output: ofosu_ghana.csv (one row per constituency, 60 rows)

#install.packages("dplyr")
library(dplyr)

cdf <- read.csv("data/gko_cdf_spending_data10162017-2.csv")
competition <- read.csv("data/gko_electoral_competition-2.csv")
absence <- read.csv("data/gko_mpabsence_data-2.csv")

## treatment = medium or high intensity of election observation, control = low intensity
## (same coding as the paper's treat_cond)
cdf <- cdf %>%
  mutate(observers = ifelse(sat_expAsunka > 1, 1, 0))

## add up CDF spending over 2014-2016 for each constituency
## and divide by the total CDF funds the constituency was supposed to get
## (348,667 in 2014 + 403,688 in 2015 + 512,632 in 2016 = 1,264,987)
spending <- cdf %>%
  group_by(CON_NAME) %>%
  summarize(region = first(REGION),
            observers = mean(observers),
            public = sum(public, na.rm = T)) %>%
  mutate(public_pct = 100 * public / 1264987)

## the paper rescales Hemang Lower Denkyira to the first two years
## because its 2016 spending was extremely high
spending <- spending %>%
  mutate(public_pct = ifelse(CON_NAME == "Hemang Lower Denkyira",
                             100 * public / (348667 + 403688),
                             public_pct))

## add MP absence and the party of the incumbent MP
ofosu <- spending %>%
  left_join(absence[, c("CON_NAME", "abs")], by = "CON_NAME") %>%
  left_join(competition[, c("CON_NAME", "incumbent_party_13")], by = "CON_NAME") %>%
  mutate(absence_pct = 100 * abs,
         incumbent_npp = ifelse(incumbent_party_13 == "NPP", 1, 0)) %>%
  rename(constituency = CON_NAME) %>%
  select(constituency, region, observers, public_pct, absence_pct, incumbent_npp)

## checks
dim(ofosu)
table(ofosu$observers)
table(ofosu$incumbent_npp)
colSums(is.na(ofosu))

write.csv(ofosu, "ofosu_ghana.csv", row.names = F)

## Week 12 activity: building the dyad-year dataset with the peacesciencer package
## Output: dyad_years.csv (one row per pair of countries per year, 1950-2000)

#install.packages("peacesciencer")
library(peacesciencer)
#install.packages("dplyr")
library(dplyr)

## every pair of countries in the Correlates of War system, every year
## directed = FALSE so each pair appears once per year (not once for each ordering)
dyads <- create_dyadyears(system = "cow", directed = FALSE) %>%
  filter(year >= 1950 & year <= 2000)

## democracy scores (polity21 and polity22 are the Polity scores of each country)
dyads <- add_democracy(dyads)

## land and sea borders (conttype is 0 if the two countries are not contiguous)
dyads <- add_contiguity(dyads)

## distance between capitals in km
dyads <- add_capital_distance(dyads)

## militarized interstate dispute onset (cowmidonset is 1 if a dispute started that year)
dyads <- add_cow_mids(dyads)

## joint democracy = both countries have a Polity score of 6 or higher
dyads <- dyads %>%
  mutate(joint_democracy = ifelse(polity21 >= 6 & polity22 >= 6, 1, 0),
         contiguity = ifelse(conttype > 0, 1, 0),
         mid_onset = cowmidonset,
         capdist = capdist / 1000)   # capdist now in thousands of km

## keep only dyad-years where both countries have a Polity score
dyads <- dyads %>%
  filter(!is.na(polity21) & !is.na(polity22))

dyad_years <- dyads %>%
  select(ccode1, ccode2, year, joint_democracy, contiguity, capdist, mid_onset)

## checks
dim(dyad_years)
table(dyad_years$joint_democracy)
table(dyad_years$contiguity)
table(dyad_years$mid_onset)
colSums(is.na(dyad_years))

write.csv(dyad_years, "dyad_years.csv", row.names = F)

## the two regressions used in the activity
model1 <- lm(mid_onset ~ joint_democracy, data = dyad_years)
model2 <- lm(mid_onset ~ joint_democracy + contiguity + capdist, data = dyad_years)
summary(model1)
summary(model2)

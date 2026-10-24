# Creates ps3-ww1-nazi-vote.csv for the Week 11 activity.
# Data: replication data for De Juan, Haass, Koos, Riaz & Tichelbaecker (2023),
# "War and Nationalism" (APSR), Harvard Dataverse doi:10.7910/DVN/WOEWJ3.
# Only file needed: ww1_main_data.rds
# Put ww1_main_data.rds in your working directory, then run this file.

ww1 <- readRDS("ww1_main_data.rds")

# keep one election (November 1932) so each county is one row
ww1 <- subset(ww1, election_id == "1932_11")

# the variables students use, with readable names
clean <- data.frame(
  county = ww1$NAME,
  nationalist_vote_percent = ww1$right_wing_share,
  fatality_percent = ww1$pct_dead * 100,
  lutheran_percent = ww1$luthpopr,
  city = ww1$stadt_dummy,
  prewar_conservative_vote_percent = ww1$conservative_vote_pre_ww1
)

# drop counties missing any of these variables so every regression uses the same counties
clean <- clean[complete.cases(clean), ]

write.csv(clean, "ps3-ww1-nazi-vote.csv", row.names = FALSE)
cat(nrow(clean), "counties written to ps3-ww1-nazi-vote.csv\n")

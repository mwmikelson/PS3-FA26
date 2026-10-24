# Creates ps3-misinformation-india.csv for the Week 12 activity.
# Data: replication data for Amar, Badrinathan, Chauchard & Sichart (2025),
# "Countering Misinformation Early" (APSR), Harvard Dataverse doi:10.7910/DVN/G2BK1G.
# Only file needed: merged.rds
# Put merged.rds in your working directory, then run this file.

merged <- readRDS("merged.rds")

clean <- data.frame(
  treatment = ifelse(merged$treatment == "Media Literacy", "Media Literacy", "Control (Spoken English)"),
  accuracy_discernment = merged$accuracy_discernment,
  sharing_discernment = merged$sharing_discernment,
  health_preferences = merged$health_preferences,
  source_discernment = merged$source_discernment,
  engagement_attitude = merged$engagement_attitude,
  engagement_behavior = merged$engagement_behavior,
  awareness = merged$awareness,
  age = merged$age,
  girl = merged$gender_num,
  grade = merged$class,
  asset_index = merged$asset_index,
  mobile_internet = merged$mobile_internet_num,
  reading = merged$reading,
  science = merged$science,
  sessions_attended = merged$compliance
)

# drop the one student missing grade so every regression uses the same students
clean <- clean[complete.cases(clean[, c("age", "girl", "grade", "asset_index", "mobile_internet", "reading", "science")]), ]

write.csv(clean, "ps3-misinformation-india.csv", row.names = FALSE)
cat(nrow(clean), "students written to ps3-misinformation-india.csv\n")

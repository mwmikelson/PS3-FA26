# clean_ces_week9.R
# Builds ps3_cces2020_week9.csv, the single dataset used in every part of the
# Week 9 activity, from the 2020 Cooperative Election Study (CES) Common Content.
#
# Download (free, Harvard Dataverse): "Cooperative Election Study Common
# Content, 2020", doi:10.7910/DVN/E9N6PH
#   - the main data file with vote validation (named something like
#     CES20_Common_OUTPUT_vv.csv; it contains the vvweight column)
#   - the 2020 Guide, to double check question wording and variable names
#
# Put the data file in your working directory, change `raw.file` if the name
# differs, then run this script.

raw.file <- "CES20_Common_OUTPUT_vv.csv"
raw <- read.csv(raw.file)

# Check that every column we need exists before doing anything else
needed <- c("vvweight", "educ", "pid3",
            "CC20_327a", "CC20_327d", "CC20_327e",                       # health care
            "CC20_331a", "CC20_331b", "CC20_331c", "CC20_331d", "CC20_331e",  # immigration
            "CC20_300_1", "CC20_300_2", "CC20_300_3", "CC20_300_4")      # media use
missing.cols <- setdiff(needed, names(raw))
if (length(missing.cols) > 0) {
  cat("Columns starting with CC20_300:\n")
  print(grep("^CC20_300", names(raw), value = TRUE))
  stop("These columns are not in the file: ", paste(missing.cols, collapse = ", "))
}

# Policy questions are coded 1 = support, 2 = oppose (anything else is a skip)
recode.support <- function(x) ifelse(x == 1, 1, ifelse(x == 2, 0, NA))
# "Check all that apply" questions are coded 1 = selected, 2 = not selected
recode.selected <- function(x) ifelse(x == 1, 1, ifelse(x == 2, 0, NA))

# pid3: 1 = Democrat, 2 = Republican, 3 = Independent, 4 = Other, 5 = Not sure
party <- ifelse(raw$pid3 == 1, "Democrat",
         ifelse(raw$pid3 == 2, "Republican",
         ifelse(raw$pid3 == 3, "Independent",
         ifelse(raw$pid3 %in% c(4, 5), "Other", NA))))

clean <- data.frame(
  vvweight        = raw$vvweight,
  # educ: 1 = no HS ... 5 = 4-year degree, 6 = post-grad
  college         = ifelse(raw$educ %in% 1:6, as.numeric(raw$educ >= 5), NA),
  party           = party,
  republican      = as.numeric(party == "Republican"),
  democrat        = as.numeric(party == "Democrat"),
  # immigration (Part A)
  legal_status    = recode.support(raw$CC20_331a),
  border_patrol   = recode.support(raw$CC20_331b),
  withhold_funds  = recode.support(raw$CC20_331c),
  reduce_legal    = recode.support(raw$CC20_331d),
  border_wall     = recode.support(raw$CC20_331e),
  # health care (Parts B-D)
  medicare_expand = recode.support(raw$CC20_327a),
  repeal_aca      = recode.support(raw$CC20_327d),
  restore_mandate = recode.support(raw$CC20_327e),
  # media use in the past 24 hours (Parts B-D)
  social_media    = recode.selected(raw$CC20_300_1),
  tv_news         = recode.selected(raw$CC20_300_2),
  newspaper       = recode.selected(raw$CC20_300_3),
  radio_news      = recode.selected(raw$CC20_300_4)
)

# Students haven't learned how to handle missing values, so keep only
# respondents with a weight and a valid answer to every variable
clean <- clean[complete.cases(clean), ]

write.csv(clean, "ps3_cces2020_week9.csv", row.names = FALSE)

# ---- Sanity checks: look at these before giving the file to students ----
nrow(clean)
summary(clean$vvweight)
table(clean$party)

# 1. Check the media coding. The 2020 Guide reports that out of 61,000
#    respondents, 46,472 used social media, 36,958 watched TV news, 22,983
#    read a newspaper, and 18,215 listened to radio news in the past 24 hours,
#    which is roughly 0.76, 0.61, 0.38, and 0.30. Yours will differ a bit
#    (we dropped respondents without vvweight), but should be close. If not,
#    the CC20_300_# columns are in a different order than assumed above.
round(colMeans(clean[, c("social_media", "tv_news", "newspaper", "radio_news")]), 2)

# 2. Check that the raw coding was what we assumed (should only be 1s and 2s)
table(raw$CC20_300_1, useNA = "ifany")
table(raw$CC20_327a, useNA = "ifany")

# 3. Preview the comparisons used in Parts B-D. In Part D, the small-sample
#    p-value (small.dim) should be above 0.05 for the activity to make its point.
library(estimatr)
small.data <- head(clean, 200)
difference_in_means(medicare_expand ~ tv_news,    data = clean, condition1 = 0, condition2 = 1)
difference_in_means(repeal_aca ~ social_media,    data = clean, condition1 = 0, condition2 = 1)
difference_in_means(restore_mandate ~ party,      data = clean, condition1 = "Democrat", condition2 = "Republican")
difference_in_means(repeal_aca ~ tv_news, data = subset(clean, republican == 1), condition1 = 0, condition2 = 1)
difference_in_means(repeal_aca ~ tv_news, data = subset(clean, democrat == 1),   condition1 = 0, condition2 = 1)
difference_in_means(repeal_aca ~ tv_news, data = subset(clean, college == 1),    condition1 = 0, condition2 = 1)
difference_in_means(repeal_aca ~ tv_news, data = subset(clean, college == 0),    condition1 = 0, condition2 = 1)
difference_in_means(medicare_expand ~ radio_news, data = clean,      condition1 = 0, condition2 = 1)   # full.dim
difference_in_means(medicare_expand ~ radio_news, data = small.data, condition1 = 0, condition2 = 1)   # small.dim

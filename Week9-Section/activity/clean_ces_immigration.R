# clean_ces_immigration.R
# Builds ps3_cces2020_immigration.csv for the Week 9 activity from the
# 2020 Cooperative Election Study (CES) Common Content.
#
# Download (free, Harvard Dataverse): "Cooperative Election Study Common
# Content, 2020", doi:10.7910/DVN/E9N6PH
#   - the main data file with vote validation (named something like
#     CES20_Common_OUTPUT_vv.csv; it contains the vvweight column)
#   - the 2020 Guide and the questionnaire PDF, to double check question wording
#
# Put the data file in your working directory, change `raw.file` if the
# name differs, then run this script.

raw.file <- "CES20_Common_OUTPUT_vv.csv"
raw <- read.csv(raw.file)

# Check that every column we need exists before doing anything else
needed <- c("vvweight", "educ", "pid3",
            "CC20_331a", "CC20_331b", "CC20_331c", "CC20_331d", "CC20_331e")
missing.cols <- setdiff(needed, names(raw))
if (length(missing.cols) > 0) {
  stop("These columns are not in the file: ", paste(missing.cols, collapse = ", "))
}

# CES policy questions are coded 1 = support, 2 = oppose (anything else is a skip)
recode.support <- function(x) ifelse(x == 1, 1, ifelse(x == 2, 0, NA))

clean <- data.frame(
  vvweight       = raw$vvweight,
  # educ: 1 = no HS ... 5 = 4-year degree, 6 = post-grad
  college        = ifelse(raw$educ %in% 1:6, as.numeric(raw$educ >= 5), NA),
  # pid3: 1 = Democrat, 2 = Republican, 3 = Independent, 4 = Other, 5 = Not sure
  republican     = ifelse(raw$pid3 %in% 1:5, as.numeric(raw$pid3 == 2), NA),
  democrat       = ifelse(raw$pid3 %in% 1:5, as.numeric(raw$pid3 == 1), NA),
  legal_status   = recode.support(raw$CC20_331a),
  border_patrol  = recode.support(raw$CC20_331b),
  withhold_funds = recode.support(raw$CC20_331c),
  reduce_legal   = recode.support(raw$CC20_331d),
  border_wall    = recode.support(raw$CC20_331e)
)

# Students haven't learned how to handle missing values, so keep only
# respondents with a weight and a valid answer to every variable
clean <- clean[complete.cases(clean), ]

write.csv(clean, "ps3_cces2020_immigration.csv", row.names = FALSE)

# ---- Sanity checks: look at these before giving the file to students ----
nrow(clean)
summary(clean$vvweight)
colMeans(clean)                                              # unweighted
sapply(clean[, -1], weighted.mean, w = clean$vvweight)       # weighted

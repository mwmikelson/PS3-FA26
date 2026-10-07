# make_flights_data.R
# ---------------------------------------------------------------------------
# INSTRUCTOR-ONLY. Builds ps3_bayarea_flights.csv, the dataset for the lubridate
# notebook (exercise-3-lubridate.ipynb). Students never run this.
#
# Source: Bureau of Transportation Statistics (BTS), "Reporting Carrier On-Time
# Performance" (domestic flights flown by US airlines that report to BTS).
# The script downloads one zipped file per month (2019-2023 = 60 files, each
# roughly 20-30 MB zipped), keeps flights that go TO or FROM OAK, SFO, or SJC,
# keeps a random SAMPLE_PROP of them, and writes one small CSV.
#
# Expect it to take a while the first time (mostly download time). Each month
# is cached in RAW_DIR, so if it stops partway, just run it again.
#
# Run it from the folder where you want the CSV to land:
#   Rscript make_flights_data.R        (or source() it in RStudio)
# ---------------------------------------------------------------------------

library(tidyverse)
library(lubridate)

setwd("/Users/mikelson/Local-GitHub/PS3-FA26/Advanced-Exercises/Exercise-3-lubridate")

options(timeout = 3600)   # these are big files; R's default 60 seconds is too short

AIRPORTS    <- c("OAK", "SFO") ## removed SJC to save space so we can keep all the flights
YEARS       <- 2019:2023
SAMPLE_PROP <- 1        # keep a random 5% of flights (the notebook text says 5%)
SEED        <- 3
RAW_DIR     <- "bts_cache"
OUT_FILE    <- "ps3_bayarea_flights.csv"
OUT_FILE_DTA    <- "ps3_bayarea_flights.dta"

# One zip per month. If BTS ever changes this address, the files are listed at
# https://www.transtats.bts.gov/PREZIP/
bts_url <- function(year, month) {
  sprintf("https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_%d_%d.zip",
          year, month)
}

# The BTS columns we need
KEEP <- c("FlightDate", "IATA_CODE_Reporting_Airline", "Origin", "Dest",
          "CRSDepTime", "DepDelay", "ArrDelay", "Cancelled", "Distance")

# Read one month's CSV, keep Bay Area flights, sample, and reshape.
process_csv <- function(csv_path, seed) {
  set.seed(seed)
  read_csv(csv_path,
           col_select = all_of(KEEP),
           col_types = cols(.default = col_character()),
           progress = FALSE) %>%
    filter(Origin %in% AIRPORTS | Dest %in% AIRPORTS) %>%
    slice_sample(prop = SAMPLE_PROP) %>%
    mutate(
      date      = as_date(parse_date_time(FlightDate, orders = c("ymd", "mdy", "mdy HMS"))),
      clock     = as.integer(CRSDepTime) %% 2400,                 # scheduled departure as hhmm
      clock_txt = if_else(is.na(clock), NA_character_,
                          sprintf("%02d:%02d", clock %/% 100, clock %% 100)),
      # Deliberately stored as plain TEXT (month/day/year) so students must convert it
      flight_date     = paste0(month(date), "/", day(date), "/", year(date)),
      sched_departure = paste(flight_date, clock_txt),
      carrier   = IATA_CODE_Reporting_Airline,
      origin    = Origin,
      dest      = Dest,
      airport   = if_else(Origin %in% AIRPORTS, Origin, Dest),
      direction = if_else(Origin %in% AIRPORTS, "departing", "arriving"),
      dep_delay = as.numeric(DepDelay),
      arr_delay = as.numeric(ArrDelay),
      cancelled = as.integer(as.numeric(Cancelled)),
      distance  = as.numeric(Distance)
    ) %>%
    arrange(date, clock) %>%
    select(flight_date, sched_departure, carrier, origin, dest, airport,
           direction, dep_delay, arr_delay, cancelled, distance)
}

# Download (if needed), process, and cache one month.
get_month <- function(year, month) {
  dir.create(RAW_DIR, showWarnings = FALSE)
  cache_file <- file.path(RAW_DIR, sprintf("processed_%d_%02d.rds", year, month))
  if (file.exists(cache_file)) return(readRDS(cache_file))

  message("Downloading ", year, "-", sprintf("%02d", month), " ...")
  zip_file <- tempfile(fileext = ".zip")
  download.file(bts_url(year, month), zip_file, mode = "wb", quiet = TRUE)

  csv_name <- grep("\\.csv$", unzip(zip_file, list = TRUE)$Name, value = TRUE)[1]
  exdir <- tempfile()
  unzip(zip_file, files = csv_name, exdir = exdir)

  result <- process_csv(file.path(exdir, csv_name), seed = SEED + year * 100 + month)

  unlink(c(zip_file, exdir), recursive = TRUE)   # the raw month is big; keep only the small result
  saveRDS(result, cache_file)
  result
}

months <- expand_grid(year = YEARS, month = 1:12)
flights <- map2_dfr(months$year, months$month, get_month)

write_csv(flights, OUT_FILE)

write_dta(flights, OUT_FILE_DTA)

# Quick sanity checks to look over before handing the file to students
message("\nWrote ", OUT_FILE, ": ", nrow(flights), " rows")
print(flights %>% count(year = mdy(flight_date) %>% year()))
print(flights %>% count(airport, direction))
print(flights %>% summarize(cancelled_share = mean(cancelled, na.rm = TRUE)))
print(head(flights))

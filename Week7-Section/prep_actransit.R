# Builds ps3_actransit_ridership.csv from the AC Transit FOIA workbook (foia-data-26-165.xlsx, sheet "ridership").
# One row = one route, in one month, on one day type (Weekday / Saturday / Sunday).
library(readxl)

raw <- read_excel("foia-data-26-165.xlsx", sheet = "ridership")

ac <- data.frame(
  route            = as.character(raw$Route),
  type             = raw$Type,
  year             = raw$Year,
  month            = raw$Month,
  day_type         = raw[["Day Type"]],
  avg_daily_riders = raw[["Ave Daily Px"]]
)

# 67 weekday rows have no ridership number; drop them
ac <- subset(ac, !is.na(avg_daily_riders))

# Flag route-months where the route has data for ALL THREE day types (Weekday, Saturday, Sunday),
# so comparisons across day types are comparisons of the same routes
n.daytypes <- aggregate(day_type ~ route + year + month, data = ac, FUN = function(x) length(unique(x)))
names(n.daytypes)[4] <- "n_day_types"
ac <- merge(ac, n.daytypes, by = c("route", "year", "month"))
ac$all_three_days <- as.integer(ac$n_day_types == 3)
ac$n_day_types <- NULL

month.order <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
ac <- ac[order(ac$year, match(ac$month, month.order), ac$route, ac$day_type),
         c("route", "type", "year", "month", "day_type", "avg_daily_riders", "all_three_days")]

write.csv(ac, "ps3_actransit_ridership.csv", row.names = FALSE)

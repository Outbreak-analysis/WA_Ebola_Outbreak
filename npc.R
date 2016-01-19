country <- dat$Country[[1]]
dat <- subset(dat,
	TRUE
		& Location==""
		& Case.definition == "Confirmed"
		& Ebola.data.source == "Patient database"
	, select = c("Epi.week", "Numeric")
)
names(dat) <- c("epiweek", "cases")

dat <- within(dat, {
	week_ending <- sub(".*to ", "", epiweek)
	week_ending <- as.Date(week_ending, format="%d %B %Y")
	pre <- week_ending<as.Date("2014-09-1")
})

print(summary(dat))

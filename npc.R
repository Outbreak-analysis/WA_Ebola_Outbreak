
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
	pre <- week_ending<startDate
})

dat <- dat[order(dat$week_ending), ]
print(dat)

inc <- with(dat, data.frame(
	week = floor((week_ending-startDate)/7)
	, cases = cases
))

inc <- subset(inc, week>=0)
print(inc)
write.csv(inc, csvname, row.names=FALSE)

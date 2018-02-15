library(ggplot2)
theme_set(theme_bw(base_size=20))

p <- (ggplot(dat, aes(x=week_ending, y=cases))
	+ geom_line(size=1.5)
	+ geom_point(size=3, aes(color=pre))
	+ ggtitle(country)
	+ xlab("")
	+ guides(color=FALSE)
)

print(p)
print(p+scale_y_log10())


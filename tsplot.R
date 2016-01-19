library(ggplot2)
theme_set(theme_bw())

p <- (ggplot(dat, aes(x=week_ending, y=cases))
	+ geom_point()
	+ geom_line(size=1.5)
	+ ggtitle(country)
)

print(p)
print(p+scale_y_log10())

print(p+aes(color=pre))
print(p+aes(color=pre)+scale_y_log10())

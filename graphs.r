library(ggplot2)

# emakina colors
tangerine<-"#ff7f41" #orange
tangerine_transparent<-"#ff7f4185"
chartreuse<- "#8cc63f" #green
chartreuse_transparent<- "#8cc63f85"
azure<- "#008fd4" #blue
colors <- c(tangerine, chartreuse)

names<-c("timesheet","deployment updates","templating","fake")
tediousness<-c(10, 5,4,10)
frequency<- c(4,9,4,10)


data <-data.frame(names, frequency, tediousness)
data$annoyance<-data$frequency + 2* data$tediousness



p<-ggplot(data, aes(x=frequency,y=tediousness)) +
   geom_point(aes(color=annoyance), size = 4) +
   geom_text(aes(label=names),hjust="inward",vjust=2) +
   scale_colour_gradient(low=chartreuse, high=tangerine) + # color coding of points
   xlab('Frequency') + ylab('Tediousness') + # Axis labels
   # lim is the range of the x-axis, breaks defines which ticks to display, and labels are the labels of the ticks
   scale_x_continuous(lim=c(0,max(data$frequency)), breaks=c(0, max(data$frequency)), labels=c('Low', 'High')) +
   # same as for x-axis :)
   scale_y_continuous(lim=c(0,max(data$tediousness)), breaks=c(0, max(data$tediousness)), labels=c('Low', 'High'))

p
ggsave("./assets/scatterplot.png", p, bg = "transparent")

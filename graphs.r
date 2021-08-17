library(ggplot2)

# emakina colors
tangerine<-"#ff7f41" #orange
tangerine_transparent<-"#ff7f4185"
chartreuse<- "#8cc63f" #green
chartreuse_transparent<- "#8cc63f85"
azure<- "#008fd4" #blue
colors <- c(tangerine, chartreuse)
black<-"#000000"
grey1<-"#c8c8c8" # light grey
grey2<-"#969696" # middle grey
grey3<-"#646464" # dark grey

names<-c("timesheet","deployment updates","templating","fake")
tediousness<-c(10, 5,4,10)
frequency<- c(4,9,4,10)


data <-data.frame(names, frequency, tediousness)
data$annoyance<-data$frequency + 2* data$tediousness



p<-ggplot(data, aes(x=frequency,y=tediousness)) +
   geom_point(aes(color=annoyance), size=6) +
   geom_text(aes(label=names),hjust="inward",vjust=2) +
   #color labels and breaks (put in the legend)
   scale_colour_gradient(low=chartreuse, high=tangerine,breaks=c(min(data$annoyance), max(data$annoyance)),labels = c("Low", "High")) + # color coding of points
   # Axis labels and legend label
   xlab('Frequency') + ylab('Tediousness') +  labs(color="Annoyance") +
   # lim is the range of the x-axis, breaks defines which ticks to display, and labels are the labels of the ticks
   scale_x_continuous(lim=c(0,max(data$frequency)), breaks=c(0, max(data$frequency)), labels=c('Low', 'High')) +
   # same as for x-axis :)
   scale_y_continuous(lim=c(0,max(data$tediousness)), breaks=c(0, max(data$tediousness)), labels=c('Low', 'High'))

# label sizes
titleSize<-18
labelSize<-14

p<-p+theme(
text=element_text(size=16),
  # set colour to NA otherwise you have a small white border - ANNOYING!
  plot.background=element_rect(fill=black,colour=NA),
  legend.background=element_rect(fill=black),
  panel.background = element_rect(fill = black,
                                size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                colour = tangerine),
  panel.grid.minor = element_line(size = 0.25, linetype = 'dashed',
                                colour = grey3)
  ,legend.text=element_text(color=grey3)
  ,legend.title=element_text(color=grey3)

  ,axis.title.x = element_text( color=grey3)
  ,axis.title.y = element_text( color=grey3)
  #,plot.margin=grid::unit(c(0,0,0,0), "mm")
  )
p
ggsave("./assets/scatterplot.png", p)

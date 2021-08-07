library(ggplot2)

# emakina colors
tangerine<-"#ff7f41" #orange
chartreuse<- "#8cc63f" #green
azure<- "#008fd4" #blue
colors <- c(tangerine, chartreuse)

names<-c("timesheet","deployment updates","templating")
annoyance<-c(10, 5,4)
frequency<- c(4,9,4)


data <-data.frame(names, frequency, annoyance)
data$radius<-data$frequency + 2* data$annoyance
data$color<-data$radius


p<-ggplot(data, aes(x=frequency,y=annoyance)) + 
   geom_point(aes(color=color), size = 4) +
   geom_text(aes(label=names),hjust="inward",vjust=2) +
   xlim(0,NA) + ylim(0,NA) + # make sure origin is in plot
   scale_colour_gradient(low=chartreuse, high=tangerine)
p

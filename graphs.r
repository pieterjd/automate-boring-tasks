library(ggplot2)
names<-c("timesheet","templating")
frequency<- c(1,4)
annoyance<-c(10, 4)

data <-data.frame(names, frequency, annoyance)
data$radius<-data$frequency + 2* data$annoyance


p<-ggplot(data, aes(x=frequency,y=annoyance)) + geom_point(aes(size=radius)) +geom_text(aes(label=names),vjust="inward",hjust="inward", size=8)

p
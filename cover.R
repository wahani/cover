#Load data
library(tidyr)
library(dplyr)

SimData <- read.csv('C:/Users/Birte Schaper/Desktop/CoverPhd/line.csv', sep = ",")

SimData$X.3 <- (SimData$X.3 + 1) * 100
long_SimData <- SimData %>% gather(Parameter, Value, X.1, X.2, X.3)

long_SimData$i[long_SimData$Parameter == "X.2"] <- long_SimData$i + 3 
long_SimData$i[long_SimData$Parameter == "X.3"] <- long_SimData$i + 6


library(ggplot2)

ggplot(aes(x = i, y = Value, group = Parameter), data = long_SimData) + 
  geom_point(size = 2, aes(colour = Parameter))

ggplot(aes(x = X.2, y = X.1), data = SimData) + 
  geom_path()

ggplot(aes(x = i, y = Value, group = Parameter), data = long_SimData) + 
  geom_line(size = 3, aes(colour = Parameter)) +
  facet_wrap(~ Parameter)

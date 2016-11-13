#Load data
library(tidyr)
library(dplyr)
library(ggplot2)
library(dat)

set.seed(7)
simData <- read.csv("data/line.csv", sep = ",")
simData$X.3 <- abs(simData$X.3) * 100
simData <- simData %>% gather(Parameter, Value, X.1, X.2, X.3)
simData <- mutar(
  simData,
  x ~ lag(Value) + cumsum(rnorm(length(Value), sd = 10)),
  by = "Parameter"
)

ggplot(mutar(simData, ~ i > 20), aes(x = x, y = Value, group = i)) + 
  geom_polygon(aes(fill = i), colour = "#202020") +
  #scale_alpha(range = c(1 / 20, 1 / 3), guide = FALSE) +
  scale_fill_gradient(low = "#CAF270", high = "#453B52", guide = FALSE) +
  ## scale_colour_gradient(low = "#CAF270", high = "#453B52", guide = FALSE) +
  coord_polar() +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "#202020")
#    line = element_blank(),
#    text = element_blank()
  )

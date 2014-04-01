#Anshul trying his hand at R

library(streamR)
#load("my_oauth")

tweets.df <- parseTweets("data/tweets_compilation.json", verbose = TRUE)

# quick map to visualize where tweets are coming from
library(ggplot2)
library(grid)
map.data <- map_data("world")
points <- data.frame(x = as.numeric(tweets.df$lon), y = as.numeric(tweets.df$lat))
# deleting tweets sent from (0,0) coordinates (probably errors)
points <- points[points$y != 0 & points$x != 0, ]
# drawing map using ggplot2
ggplot(map.data) + geom_map(aes(map_id = region), map = map.data, fill = "white", 
    color = "grey20", size = 0.25) + expand_limits(x = map.data$long, y = map.data$lat) +
    scale_x_continuous(limits=c(68.17, 97.14)) + scale_y_continuous(limits=c(6.75,35.99)) +
    theme(axis.line = element_blank(), axis.text = element_blank(), axis.ticks = element_blank(), 
        axis.title = element_blank(), panel.background = element_blank(), panel.border = element_blank(), 
        panel.grid.major = element_blank(), plot.background = element_blank(), 
        plot.margin = unit(0 * c(-1.5, -1.5, -1.5, -1.5), "lines")) + geom_point(data = points, 
    aes(x = x, y = y), size = 1, alpha = 1/5, color = "darkblue")

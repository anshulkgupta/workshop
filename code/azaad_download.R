#Anshul trying his hand at R

# loading library and OAuth token
library(streamR)
load("my_oauth")

# Set the two terms
term1 <- "modi"
term2 <- "bjp"

# capturing 2 minutes of tweets sent from India
filterStream(file.name="data/tweets_2.json",track=c(term1, term2),  locations=c(68.17, 6.75, 97.4, 35.99), timeout=600, oauth=my_oauth)
# parsing tweets into dataframe
tweets.df <- parseTweets("data/tweets_2.json", verbose = TRUE)
#Anshul trying his hand at R

# loading library and OAuth token
library(streamR)
load("my_oauth")

# capturing 2 minutes of tweets sent from Africa
filterStream(file.name="tweets_africa.json", locations=c(-20,-37, 52, 35), timeout=120, oauth=my_oauth)
# parsing tweets into dataframe
tweets.df <- parseTweets("tweets_africa.json", verbose = TRUE)

## backup
# tweets.df <- parseTweets("backup/tweets_africa.json", verbose = TRUE)
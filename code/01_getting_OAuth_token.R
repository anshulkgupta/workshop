
## INSTALLING PACKAGES THAT WE WILL USE TODAY
doInstall <- FALSE  # Change to FALSE if you don't want packages installed.
toInstall <- c("ROAuth", "twitteR", "streamR", "igraph", "XML", "ggplot2", 
	"tm", "stringr", "plyr", "RCurl", "maps", "Snowball")
if(doInstall){install.packages(toInstall, repos = "http://cran.r-project.org")}
if(doInstall){install.packages("Rstem", repos = "http://www.omegahat.org/R", type="source")}

## REGISTERING OAUTH TOKEN

## Step 1: go to dev.twitter.com and sign in
## Step 2: click on your username (top-right of screen) and then on "My applications"
## Step 3: click on "Create a new application"
## Step 4: fill name, description, and website (it can be anything, even google.com)
## Step 5: Agree to user conditions and enter captcha.
## Step 6: copy consumer key and consumer secret and paste below

library(twitteR)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "fTVGqEOwEtS5jCSV2ZA"
consumerSecret <- "5epDQkOVCUMhSc2f7JK4Gw3uJ63hPEtMIdAAzDOptE"
my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
  consumerSecret=consumerSecret, requestURL=requestURL,
  accessURL=accessURL, authURL=authURL)

## run this line and go to the URL that appears on screen
# my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

my_oauth$handshake()
registerTwitterOAuth(my_oauth)
#TESTING

## Setting working folder
setwd("~/Documents/Github Code/workshop/code")

## now you can save oauth token for use in future sessions with twitteR or streamR
save(my_oauth, file="my_oauth")




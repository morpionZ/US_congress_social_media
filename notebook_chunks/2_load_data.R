if (file.exists("data/legislator.csv")) {
  legislator <- fread("data/legislator.csv")
} else {
  # Download raw files from https://github.com/unitedstates
  if (!file.exists("data/legislators-current.yaml")) {
    download.file("https://raw.githubusercontent.com/unitedstates/congress-legislators/master/legislators-current.yaml", 
                  destfile = "data/legislators-current.yaml", 
                  method = "curl")
  } 
  
  if (!file.exists("data/legislators-social-media.yaml")) {
    download.file("https://raw.githubusercontent.com/unitedstates/congress-legislators/master/legislators-social-media.yaml", 
                  destfile = "data/legislators-social-media.yaml", 
                  method = "curl")
  } 
  
  
  # Load data in memory
  tmp <- yaml.load_file("data/legislators-current.yaml")
  legislator.info <- data.table(id = sapply(tmp, function(l) l$id$bioguide),
                                name = sapply(tmp, function(l) paste(l$name$first, l$name$last)),
                                age = sapply(tmp, function(l) floor((Sys.Date() - as.Date(l$bio$birthday, "%Y-%m-%d")) / 365)),
                                gender = sapply(tmp, function(l) l$bio$gender),
                                party = sapply(tmp, function(l) l$terms[[length(l$terms)]]$party),
                                type = sapply(tmp, function(l) l$terms[[length(l$terms)]]$type),
                                state = sapply(tmp, function(l) l$terms[[length(l$terms)]]$state))
  
  tmp <- yaml.load_file("data/legislators-social-media.yaml")
  legislator.social <- data.table(id = sapply(tmp, function(l) l$id$bioguide),
                                  twitter = sapply(tmp, function(l) ifelse(is.null(l$social$twitter), 
                                                                           NA, l$social$twitter)))
  
  
  # Consolidate data in a single data table
  legislator <- merge(legislator.info, legislator.social, by = "id")
  
  
  # Connect to Twitter by running the following code. You'll need to register an 
  # application with Twitter to get an API key and secret
  consumer.key <- "Paste your Twitter API key here"
  consumer.secret <- "Paste your Twitter API secret here"
  
  twitCred <- OAuthFactory$new(consumerKey = consumer.key,
                               consumerSecret = consumer.secret,
                               requestURL = "https://api.twitter.com/oauth/request_token",
                               accessURL = "https://api.twitter.com/oauth/access_token",
                               authURL = "https://api.twitter.com/oauth/authorize")
  twitCred$handshake()
  registerTwitterOAuth(twitCred)
  
  
  # Retrieve Twitter usage data for each account
  users <- lookupUsers(legislator$twitter)
  
  twitter.table <- data.table(twitter = names(users),
                              joined = sapply(users, function(user) as.character(user$created)),
                              days = sapply(users, function(user) Sys.Date() - as.Date(user$created)),
                              tweets = sapply(users, function(user) user$statusesCount),
                              followers = sapply(users, function(user) user$followersCount),
                              following = sapply(users, function(user) user$friendsCount))
  
  
  # Consolidate data in a single data table and save
  legislator <- merge(legislator, twitter.table, by = "twitter", all.x = TRUE)
  
  write.csv(legislator, "data/legislator.csv", row.names = FALSE)
}










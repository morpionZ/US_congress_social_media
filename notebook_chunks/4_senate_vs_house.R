# Days on Twitter
g1 <- ggplot(legislator,
             aes(x = days, fill = type)) +
  geom_density(alpha = .25, adjust = .25) + 
  ylab("Density") + xlab("Number of days on Twitter since joining") +
  ggtitle(bquote(atop("Twitter presence duration", 
                      atop("in the current US Congress - Senate vs House")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(legend.justification = c(0, 1), legend.position = c(0, 1)) + 
  scale_fill_manual(labels = c("House of\nRepresentatives", "Senate"),
                    values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL))

g1 <- addBanner(g1, font.size = 4, heights = c(1, 0.05),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g1)


# Tweets posted (total)
g2 <- ggplot(legislator,
             aes(x = tweets, fill = type)) +
  geom_density(alpha = .25, adjust = 1) + 
  ylab("Density") + xlab("Total number of tweets since joining Twitter") +
  ggtitle(bquote(atop("Total Twitter activity", 
                      atop("in the current US Congress - Senate vs House")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(legend.justification = c(1, 1), legend.position = c(1, 1)) + 
  scale_fill_manual(labels = c("House of\nRepresentatives", "Senate"),
                    values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL))

g2 <- addBanner(g2, font.size = 4, heights = c(1, 0.05),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g2)


# Tweets posted per week
g3 <- ggplot(legislator,
             aes(x = (tweets / days) * 7, fill = type)) +
  geom_density(alpha = .25, adjust = 1) + 
  ylab("Density") + xlab("Average number of tweets per week since joining Twitter") +
  ggtitle(bquote(atop("Weekly Twitter activity", 
                      atop("in the current US Congress - Senate vs House")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(legend.justification = c(1, 1), legend.position = c(1, 1)) + 
  scale_fill_manual(labels = c("House of\nRepresentatives", "Senate"),
                    values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL))

g3 <- addBanner(g3, font.size = 4, heights = c(1, 0.05),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g3)


# Followers
g4 <- ggplot(legislator,
             aes(x = followers, fill = type)) +
  geom_density(alpha = .25, adjust = 1) + 
  ylab("Density") + xlab("Total number of followers") +
  ggtitle(bquote(atop("Twitter popularity", 
                      atop("in the current US Congress - Senate vs House")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(legend.justification = c(0, 1), legend.position = c(0, 1)) + 
  scale_fill_manual(labels = c("House of\nRepresentatives", "Senate"),
                    values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL)) +
  scale_x_continuous(trans = "log10")

g4 <- addBanner(g4, font.size = 4, heights = c(1, 0.05),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g4)


# Followed users
g5 <- ggplot(legislator,
             aes(x = following, fill = type)) +
  geom_density(alpha = .25, adjust = 1) + 
  ylab("Density") + xlab("Total number of followed users") +
  ggtitle(bquote(atop("Number of followed Twitter users", 
                      atop("in the current US Congress - Senate vs House")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(legend.justification = c(0, 1), legend.position = c(0, 1)) + 
  scale_fill_manual(labels = c("House of\nRepresentatives", "Senate"),
                    values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL)) +
  scale_x_continuous(trans = "log10")

g5 <- addBanner(g5, font.size = 4, heights = c(1, 0.05),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g5)
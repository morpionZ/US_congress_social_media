# Most days on Twitter
tmp <- filter(legislator, !is.na(days)) %>%
  mutate(rank = rank(-days)) %>%
  filter(rank < 51)

g1 <- ggplot(data = tmp,
             aes(x = reorder(name, -rank), 
                 y = days,
                 fill = party)) +
  geom_bar(stat = "identity", color = "white") +
  coord_flip(ylim = c(1500, 2700)) + 
  ylab("Number of days on Twitter\nsince joining") + 
  ggtitle(bquote(atop("Longest active Twitter users", 
                      atop("in the current US Congress")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(axis.title.y = element_blank(),
        legend.justification=c(1,0), legend.position=c(1,0)) + 
  scale_fill_manual(values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL))

g1 <- addBanner(g1, font.size = 4, heights = c(1, 0.05*7/10),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g1)


# Most tweets posted (total)
tmp <- filter(legislator, !is.na(tweets)) %>%
  mutate(rank = rank(-tweets)) %>%
  filter(rank < 51)

g2 <- ggplot(data = tmp,
             aes(x = reorder(name, -rank), 
                 y = tweets,
                 fill = party)) +
  geom_bar(stat = "identity", color = "white") +
  coord_flip() + 
  ylab("Total number of tweets\nsince joining") + 
  ggtitle(bquote(atop("Most active Twitter users", 
                      atop("in the current US Congress")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(axis.title.y = element_blank(),
        legend.justification=c(1,0), legend.position=c(1,0)) + 
  scale_fill_manual(values = c("dodgerblue4", "chartreuse3", "red3"),
                    guide = guide_legend(title = NULL))

g2 <- addBanner(g2, font.size = 4, heights = c(1, 0.05*7/10),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g2)


# Most tweets posted per week
tmp <- filter(legislator, !is.na(tweets)) %>%
  mutate(tweet.per.week = (tweets / days) * 7) %.%
  mutate(rank = rank(-tweet.per.week)) %>%
  filter(rank < 51)

g3 <- ggplot(data = tmp,
             aes(x = reorder(name, -rank), 
                 y = tweet.per.week,
                 fill = party)) +
  geom_bar(stat = "identity", color = "white") +
  coord_flip() + 
  ylab("Average number of tweets per week\nsince joining") + 
  ggtitle(bquote(atop("Most active Twitter users", 
                      atop("in the current US Congress")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(axis.title.y = element_blank(),
        legend.justification=c(1,0), legend.position=c(1,0)) + 
  scale_fill_manual(values = c("dodgerblue4", "chartreuse3", "red3"),
                    guide = guide_legend(title = NULL))

g3 <- addBanner(g3, font.size = 4, heights = c(1, 0.05*7/10),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g3)


# Most followers
tmp <- filter(legislator, !is.na(followers)) %>%
  mutate(rank = rank(-followers)) %>%
  filter(rank < 51)

g4 <- ggplot(data = tmp,
             aes(x = reorder(name, -rank), 
                 y = followers,
                 fill = party)) +
  geom_bar(stat = "identity", color = "white") +
  coord_flip() + 
  ylab("Total number of followers") + 
  ggtitle(bquote(atop("Most popular Twitter users", 
                      atop("in the current US Congress")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(axis.title.y = element_blank(),
        legend.justification=c(1,0), legend.position=c(1,0)) + 
  scale_fill_manual(values = c("dodgerblue4", "chartreuse3", "red3"),
                    guide = guide_legend(title = NULL))

g4 <- addBanner(g4, font.size = 4, heights = c(1, 0.05*7/10),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g4)


# Most followed users
tmp <- filter(legislator, !is.na(following)) %>%
  mutate(rank = rank(-following)) %>%
  filter(rank < 51)

g5 <- ggplot(data = tmp,
             aes(x = reorder(name, -rank), 
                 y = following,
                 fill = party)) +
  geom_bar(stat = "identity", color = "white") +
  coord_flip() + 
  ylab("Total number of followed users") + 
  ggtitle(bquote(atop("Most following Twitter users", 
                      atop("in the current US Congress")))) +
  theme_graphzoo(base_size = 13, family = "Droid Sans Mono") + 
  theme(axis.title.y = element_blank(),
        legend.justification=c(1,0), legend.position=c(1,0)) + 
  scale_fill_manual(values = c("dodgerblue4", "red3"),
                    guide = guide_legend(title = NULL))

g5 <- addBanner(g5, font.size = 4, heights = c(1, 0.05*7/10),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES")

print(g5)


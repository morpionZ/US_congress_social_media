# Date joined Twitter
g1 <- ggplot(legislator,
             aes(x = as.Date(joined))) +
  stat_bin(breaks = as.numeric(seq(as.Date('2007-1-1'), 
                                   as.Date('2014-12-31'), '2 months')),
           position = "identity") + 
  scale_x_date(breaks = date_breaks("year"), 
               labels = date_format('%Y')) +
  ylab("Count (per 2 months)") + xlab(NULL) +
  ggtitle(bquote(atop("When did current US Congress members joined Twitter?", 
                      atop("")))) +
  theme_graphzoo(base_size = 16, family = "Droid Sans Mono") 

g1 <- addBanner(g1, font.size = 4, heights = c(1, 0.05),
                l.txt = "GRAPHZOO.TUMBLR.COM", 
                r.txt = "SOURCE: GITHUB.COM/UNITEDSTATES, TWITTER")

print(g1)

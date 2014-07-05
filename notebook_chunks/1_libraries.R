# Load all necessary libraries to compile the notebook
require("yaml")
require("data.table")
require("dplyr")
require("twitteR")
require("ggplot2")
if (!require("graphZoo")) {
  require("devtools")
  install_github("morpionZ/graphZoo")
}
require("extrafont")
loadfonts()
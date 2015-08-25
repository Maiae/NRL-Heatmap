# load library
library(d3heatmap)

# load data
nrl <- read.csv("https://dl.dropboxusercontent.com/u/13904341/NRL_fullbacks_AUG_2015.csv")

# sort by Meters Run per Game
nrl <- nrl[order(nrl$METERS_RUN_PER_GAME),]

# create player club column
nrl$PLAYER <- paste(nrl$PLAYER, nrl$CLUB, sep = ", ", collapse = NULL)

# exclude Club, Position, Field Goals, Run Meters, Tries, Goals, Games Played this season
# keep "per game" stats
nrl$CLUB <- NULL
nrl$POSITION <- NULL
nrl$GAMES_PLAYED <- NULL
nrl$RUN_METERS <- NULL
nrl$HIT_UPS <- NULL
nrl$TRIES <- NULL
nrl$GOALS <- NULL
nrl$FIELD_GOALS <- NULL
nrl$POINTS <- NULL
nrl$TACKLES <- NULL

# turn player names are column names
row.names(nrl) <- nrl$PLAYER
nrl$PLAYER <- NULL

# change column names
colnames(nrl) <- c("Age", "Height", "Weight", "Tries per Game", "Points per Game", "Tackles per Game",  "Hit Ups per Game", "Meters Run per Game")

# heatmap with player dendogram
d3heatmap(nrl, scale = "column", colors = "YlOrRd", dendrogram = "row", xaxis_font_size=10, yaxis_font_size=10)

### end ###

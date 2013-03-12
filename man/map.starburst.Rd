\name{map.starburst}
\alias{map.starburst}
\title{Generate Starburst For Map}
\description{Computes and displays the starburst representation of the clusters for the map.}
\usage{
map.starburst(map, explicit = FALSE, smoothing = 2)
}
\arguments{
  \item{map}{an object of type 'map'.}
  \item{explicit}{controls the shape of the connected components.}
  \item{smoothing}{controls the smoothing level of the umat (NULL, 0, >0).}
}
\author{Gregory Breard}
\examples{
data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display the starburst for the map
map.starburst(m)
}
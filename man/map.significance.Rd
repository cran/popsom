\name{map.significance}
\alias{map.significance}
\title{Compute Significance Of Features}
\description{Computes the relative significance of each feature and plots it.}
\usage{
map.significance(map, graphics = TRUE, feature.labels = TRUE)
}
\arguments{
  \item{map}{an object of type 'map'.}
  \item{graphics}{a switch that controls whether a plot is generated or not.}
  \item{feature.labels}{a switch to allow the plotting of feature names vs feature indices.}
}
\value{a vector containing the significance for each feature.}
\author{Gregory Breard}
\examples{
data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display the significance for the map
map.significance(m)
}
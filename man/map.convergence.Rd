\name{map.convergence}
\alias{map.convergence}
\title{Evaluate Map Convergence}
\description{Evaluates the convergence of a map using the F-test and a Bayesian estimate of the variance in the training data.}
\usage{
map.convergence(map, conf.int = 0.95)
}
\arguments{
  \item{map}{an object of type 'map'.}
  \item{conf.int}{the confidence interval of the convergence test (default 95 percent).}
}  
\value{The convergence index of the map (variance captured by the map so far).}
\note{The convergence index is the variance of the trainig data captured by the map; maps with convergence of less than 90 percent are typically not trustworthy. Of course, the precise cut-off depends on the noise level in your training data.}
\author{Gregory Breard}
\examples{
data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display the convergence of the map
map.convergence(m)
}
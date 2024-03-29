\name{map.build}
\alias{map.build}
\title{Build Map}
\description{Construct a self-organizing map and return an object of class `map'}
\usage{
map.build(data,labels=NULL,xdim=10,ydim=5,
          alpha=0.3,train=1000,normalize=FALSE,
          seed=NULL,minimal=FALSE)
}
\arguments{
  \item{data}{A dataframe where each row contains an unlabeled training instance.}
  \item{labels}{A vector or dataframe with one label for each observation in data.}
  \item{xdim}{The x-dimension of the map.}
  \item{ydim}{The y-dimension of the map.}
  \item{alpha}{The learning rate, should be a value greater than zero and less or equal to one.}
  \item{train}{The number of training iterations.}
  \item{normalize}{Boolean switch indicating whether or not to normalize the data.}
  \item{seed}{A seed value for repeatablity of random initialization and selection.}
  \item{minimal}{Boolean switch indicating whether to build a `map.minimal' or `map' object.}
}
\details{The function `map.build' constructs an object of type `map'. The object contains two models: (1) A self-organizing map model expressed through its trained neurons and its quality of fit can be ascertained by the `convergence' (see below). (2) A cluster model expressed by the discovered centroids.  The quality of these models can be ascertained by the `map convergence', `within cluster sum of squares', and the `between cluster sum of squares' (see below). }

\value{An object of type `map'.  The object has the following member fields:
\describe{
\item{data}{Data frame contining the possibly normalized training data.}
\item{labels}{Vector of labels, one for each observation in data or NULL if no labels were given.}
\item{xdim}{The x dimension of the neuron map.}
\item{ydim}{The y dimension of the neuron map.}
\item{alpha}{The given learning rate for the neural network.}
\item{train}{The training iterations applied to the neural network.}
\item{neurons}{A list of neurons for the network. The dimensionality of this
data frame is the same as the training data.  The following two formulas
come in handy when working with the neural data.  The first set of computations
provide the x and y coordinate on the map of the neuron in row `rowix' of the `neurons' data frame,
\preformatted{
    x <- (rowix-1)\%\%map$xdim+1
    y <- (rowix-1)\%/\%map$xdim+1
}
The second formula computes the row of the neuron in position (x,y) on the map,
\preformatted{
    rowix <- x+(y-1)*map$xdim
}}
\item{heat}{This is the representation of the map which is the basis for the `starburst' plot.}
\item{fitted.obs}{List of indexes of the best matching neuron for each observation.  Each index is an row index into the `neuron' data frame.}
\item{centroids}{This is a data frame of (x,y)-locations where each cell points
  to the the (x,y)-location on the map where the corresponding centroid
  is located.  Centroids point to themselves.}
\item{unique.centroids}{A vector of actual centroid (x,y)-locations on the map. Hint: to compute the number of clusters on the map take the length of this vector.}
\item{centroid.labels}{A data frame where the (x,y)-locations of actual centroids have a label associated with them. All other locations are NULL. If the training data is unlabeled  then popsom invents a label for each centroid.}
\item{label.to.centroid}{A label-to-centroid lookup table (hash). A lookup in this table will return a list of indexes into the `unique.centroids' table. Note: a label can be associated with multiple centroids.}
\item{centroid.obs}{A vector of lists of observations per centroid indexed
by the centroid number from `unique.centroids'.  The observations on the list are row numbers of the `data' data frame.}
\item{convergence}{A quality measure of how well the map fits the training data.}
\item{wcss}{The average `within cluster sum of squares'. This is the average
distance variance within the clusters of the underlying cluster model.}
\item{bcss}{The `between cluster sum of squares'.  This is the distance
variance between the cluster centroids of the underlying cluster model.}
}
}

\note{If the `minimal' switch is set to TRUE then a `map.minimal' object is returned which only contains the trained neurons together with the training parameters. Observe that none of the POPSOM interface functions will work with this kind of object. }

\note{If your training data is unlabeled popsom will automatically
generate a label for each of the centroids it discovers.}

\author{Lutz Hamel, Benjamin Ott, Gregory Breard}

\references{
VSOM: Efficient, Stochastic Self-Organizing Map Training, Lutz Hamel, Intelligent Systems Conference (IntelliSys) 2018, K. Arai et al. (Eds.): Intelligent Systems and Applications, Advances in Intelligent Systems and Computing 869, pp 805-821, Springer, 2018.

Self-Organizing Map Convergence, Robert Tatoian and Lutz Hamel. Proceedings of the 2016 International Conference on Data Mining (DMIN'16), pp92-98, July 25-28, 2016, Las Vegas, Nevada, USA, ISBN: 1-60132-431-6, CSREA Press.

Evaluating Self-Organizing Map Quality Measures as Convergence Criteria, Gregory Breard and Lutz Hamel, Proceedings of the 2018 International Conference on Data Science (ICDATA'18), Robert Stahlbock, Gary M. Weiss, Mahmoud Abou-Nasr (Eds.), ISBN: 1-60132-481-2, pp 86-92, CSREA Press, 2018.

SOM Quality Measures: An Efficient Statistical Approach, Lutz Hamel, Proceedings of the 11th International Workshop WSOM 2016, Houston, Texas USA, E. Merenyi et al. (eds.), Advances in Self-Organizing Maps and Learning Vector Quantization, Advances in Intelligent Systems and Computing 428, Springer, pp 49-59, DOI 10.1007/978-3-319-28518-4_4, 2016.
}

\examples{
# training data
data(iris)
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

# build a map
m <- map.build(df,labels,xdim=15,ydim=10,train=10000,seed=42)

# look at the characteristics of the maps
map.summary(m)

# plot the map
map.starburst(m)
}

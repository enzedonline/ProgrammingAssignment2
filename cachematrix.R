## For a very large matrices, it may take too long to compute the inverse, 
## especially if it has to be computed repeatedly (e.g. in a loop). 
## If the contents of a vector are not changing, it may make sense to cache 
## the value of the inverse so that when we need it again, it can be looked up 
## in the cache rather than recomputed.

## This is achieved using the following two functions:
## makeMatrix - create a vector and store its inverse
## cacheSolve - retrieve the inverse stored in the makeMatrix object's memory
##              if it exists, otherwise compute the inverse and store it in the
##              makeMatrix object's memory

makeMatrix <- function(x = matrix()) {
  # Create a vector and cache its inverse in memory (see cacheSolve below)
  #
  # Args:
  #   x: function that creates a matrix, an existing matrix object is not valid
  #
  # Returns:
  #   list defining the makeMatrix object's properties and methods
  #
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

cacheSolve <- function(x, ...) {
  # retrieve the inverse stored in a makeMatrix object's memory
  # if it exists, otherwise compute the inverse and store it in the
  # makeMatrix object's memory
  #
  # Args:
  #   x: a matrix created using the makeMatrix function defined above
  #
  # Returns:
  #   Matrix object representing the inverse of the matrix defined by x
  #
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}

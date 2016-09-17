## Functions create and store inverted matrix to save computing time

# Example cache-making function from Github assignment
# makeVector <- function(x = numeric()) {
#   m <- NULL
#   set <- function(y) {
#     x <<- y
#     m <<- NULL
#   }
#   get <- function() x
#   setmean <- function(mean) m <<- mean
#   getmean <- function() m
#   list(set = set, get = get,
#        setmean = setmean,
#        getmean = getmean)
# }

## Function inverts matrix x

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL #empty placeholder
  set <- function(y) { #sub-function to generate value
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- invert # inverts matrix x, stores as m
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# Example cache-checking function from Github assignment
# cachemean <- function(x, ...) {
#   m <- x$getmean()
#   if(!is.null(m)) {
#     message("getting cached data")
#     return(m)
#   }
#   data <- x$get()
#   m <- mean(data, ...)
#   x$setmean(m)
#   m
# }

## Check if matrix is already inverted. Load cache, or calculate and store value.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setinverse(m)
  m
}

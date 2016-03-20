## There are two functions. The first function makeCacheMatrix will create a 
## matrix, the second function will inverse the matrix created by the first
## function. 


## This first function will create a matrix. It will return a list containing 
## a function to 1. set the value of the matrix 2. get the the value of the 
## matrix. 3. set the value of the inverse matrix, 4. get the value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
  # initialize the cache to NULL
  cache <- NULL
  
  # set the matrix
  set <- function(a) {
    x <<- a
    cache <<- NULL
  }
  
  # return the matrix
  get <- function() {
    x
  }
  
  # set the cache to the inverse matrix 
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  # get the cache
  getInverse <- function() {
    cache
  }
  
  list(set = set, get = get, cacheInverse = cacheInverse, getInverse = getInverse)

}


## the second function will calculate the inverse of the matirx created by the 
## first function. If the inverse has already been calculated, the function will 
## just retuen the cache of the inverse.

cacheSolve <- function(x, ...) {
        inverse<- x$getInverse()
        if (!is.null(inverse)){
          message('getting the cached data')
          return (inverse)
        }
        data<- x$getMatrix()
        inverse<- solve(data)
        x$cacheInverse(inverse)
        
        return (inverse)
}

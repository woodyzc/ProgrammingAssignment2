## There are two functions. The first function makeCacheMatrix will create a 
## matrix, the second function will inverse the matrix created by the first
## function. 


## This first function will create a matrix. It will return a list containing 
## a function to 1. set the value of the matrix 2. get the the value of the 
## matrix. 3. set the value of the inverse matrix, 4. get the value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL
  set <- function(a) {
    x <<- a
    cache <<- NULL
  }
  get <- function() {
    x
  }
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  getInverse <- function() {
    cache
  }
  list(set = set, 
       get = get, 
       cacheInverse = cacheInverse, 
       getInverse = getInverse)
}


## the second function will calculate the inverse of the matirx created by the 
## first function. If the inverse has already been calculated, the function will 
## just retuen the cache of the inverse.

cacheSolve <- function(x, ...) {
        cache<- x$getInverse()
        if (!is.null(cache)){
          message('getting the cached data')
          return (cache)
        }
        data<- x$get()
        cache<- solve(data)
        x$cacheInverse(cache)
        cache
}

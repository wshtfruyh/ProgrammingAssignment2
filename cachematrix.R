## two functions to cache inverted matrix to avoid repeatedly computing to 
## inverse matrix

## create a maxtirx object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        invm <- NULL 
        set <- function(y) { 
                x <<- y 
                invm <<- NULL
        }
        get <- function() x 
        setinv <- function() invm <<- solve(x)
        getinv <- function() invm 
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## inverses the matrix given by makeCacheMatrix. If the inverse has already been
## calculated (and the matrix has not changed), the cachesolve retrieves the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
        invm <- x$getinv()
        if(!is.null(invm)){
                message("retrieving cached data")
                return(invm)
        }
        data <- x$get()
        invm <- solve(data, ...)
        x$setinv(m)
        invm
}

## testing to confirm proper coding. 
test <- makeCacheMatrix()
test$set(matrix(10:13, 2))
test$get()
test$setinv()
test$getinv()
ls(environment(test$set))


## The following functions can compute and cache the inverse of a matrix.

## This function creates a special “matrix” object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get = function() x 
        setinv <- function(inverse) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## omputes the inverse of the “matrix” returned by makeCacheMatrix(). 
##If the inverse has already been calculated (and matrix has not changed) 
##retrieves the inverse from the cache directly.

cacheSolve <- function(x, ...) {
inv = x$getinv()
        if(!is.null(inv)) {
                message ("getting cached data")
        }
        mat.data <- x$get()
        inv <- solve(mat.data, ...)
        x$setinv(inv)
        return(inv)
}

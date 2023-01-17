## This set of 2 functions calculates the inverse of a matrix and stores it so that it can be retrieved later without having to calculate it again.

# The first function, makeCacheMatrix(), creates a special "matrix" object that caches the result of a previous inversion computation.
# The actual inversion computation happens in the cacheSolve() function. makeCacheMatrix() serves as a container for the input matrix
# and its inverse and gives the cacheSolve() function (or the user!) access to retrieve (get and getinverse) and set (set and setinverse) them.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function(){
        x
    }
    setinverse <- function(inverse){
        inv <<- inverse
    }
    getinverse <- function(){
        inv
    }
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# The second function, cacheSolve(), computes the inverse of the matrix returned by makeCacheMatrix(). 
# If the inverse has already been calculated (and the matrix was not changed from the outside), then the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(o, ...) {
    inv <- o$getinverse()
    if (!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- o$get()
    inverse <- solve(data)
    o$setinverse(inverse)
    inverse
}

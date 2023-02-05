## Put comments here that give an overall description of what your
## functions do
## 'makeCacheMatrix' is a function that creates a matrix
## where I can store the inverse matrix

## Write a short comment describing this function

makeCacheMatrix <- function( m = matrix() ) {

    j <- NULL

    # Setting the matrix
    set <- function( matrix ) {
            m <<- matrix
            i <<- NULL
    }

    # Setting how to get the matrix
    get <- function() {
    	## Return the matrix
    	m
    }

    # Setting the inverse of matrix
    setInverse <- function(inverse) {
        j <<- inverse
    }

    ## Set how to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        j
    }

    ## Setting a return list
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function
## The second function here below calculates the inverse of the matrix
## from the first function. It checks if the inverse has already calculated.
## In that case it gets the matrix from the cache

cacheSolve <- function(x, ...) {

    # Calculating
    m <- x$getInverse()

    # check of the inverse of the matrix is already present 
    if( !is.null(m) ) {
            message("Retrieving the results from cache...")
            return(m)
    }

    # get the matrix and calculate the inverse and the set the inverse
    data <- x$get()
    m <- solve(data) %*% data
    x$setInverse(m)
    m
}

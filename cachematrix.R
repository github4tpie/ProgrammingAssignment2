## These functions will create a matrix object capable of being cached
## and either solve for the inverse of a matrix or retrieve the previously cached value of the inverse.

## makeCacheMatrix will create a matrix object capable of being cached.
makeCacheMatrix <- function(x = matrix()) {
  
  ## Since we need to know if the matrix has changed,
  ## cache a copy of the matrix, x named z and cache a
  ## NULL inverse of the matrix x named y
  z <<- x
  y <<- NULL
    
  ## return the matrix contents
  get <- function() z
  
  ## return the inverse of the matrix
  getinv <- function(x) y
  
  ## solve the inverse of the matrix and cache the result
  setinv <- function() {
    y <<- solve(z)    
  }
  
  list(get = get, setinv = setinv, getinv = getinv)
  
}

## cacheSolve will calculate the inverse of a matrix.
## If inverse not yet calculated and matrix is not changed
## then it will retrieve the cached value of the inverse.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  ## Has the matrix changed (x != z)
  m <- x$get()
  if(!is.null(y) && all(m == z)) {
    ## If inverse not yet calculated and matrix is not changed then:
    message("Getting cached data")
    return(y)
  } else {
    message("Solving...")
    data <- x$get()
    ## Solve for the inverse matrix, y of matrix x
    y <<- solve(data, ...)
  }
}

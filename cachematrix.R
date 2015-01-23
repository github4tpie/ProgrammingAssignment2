## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  # Since we need to know if the matrix has changed,
  # cache a copy of the matrix, x named z and cache a
  # NULL inverse of the matrix x named y
  z <<- x
  y <<- NULL
  
  # Function to set the value of the cached matrix (z) and NULL the cached inverse
  set <- function() {
    z <<- x
    y <<- NULL
  }
  
  # return the matrix contents
  get <- function() z
  
  # return the inverse of the matrix
  getinv <- function(x) y
  
  # solve the inverse of the matrix and cache the result
  setinv <- function() {
    y <<- solve(z)    
  }
  
  # Compare the matrix, x with the existing matrix, z
  # Assumption is that both are matrices and both are square
  same <- function(x, y)
    all(x == y)
  
  list(set = set, get = get, setinv = setinv, same = same, getinv = getinv)
  
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  # Has the matrix changed (x != z)
  m <- x$get()
  if(!is.null(y) && all(m == z)) {
    # If inverse not yet calculated and matrix is not changed then
    message("Getting cached data")
    return(y)
  } else {
    message("Solving...")
    data <- x$get()
    # Solve for the inverse matrix, y of matrix x
    y <<- solve(data, ...)
  }
}

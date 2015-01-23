
source("cacheMatrix.R")

m <- matrix(c(1,3,5,7),2,2)
m1 <- matrix(c(2,4,6,8),2,2)

p <- makeCacheMatrix(m)
q <- cacheSolve(p)
q <- cacheSolve(p)
q <- cacheSolve(p)

p <- makeCacheMatrix(m1)
q <- cacheSolve(p)
q <- cacheSolve(p)
q <- cacheSolve(p)

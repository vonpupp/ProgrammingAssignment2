# To run it on the console:
c <- rbind(c(1/3, 3/2), c(3/2, 1))
m <- makeCacheMatrix(c)
s <- cacheSolve(m)
s
# This should return the identity matrix
identity = s %*% c

# Solve it again and get the msg: "getting cached data"
s <- cacheSolve(m)


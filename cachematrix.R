# Assignment: Caching the Inverse of a Matrix
#
# Matrix inversion is usually a costly computation and their may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly (there
# are also alternatives to matrix inversion that we will not discuss here). Your
# assignment is to write a pair of functions that cache the inverse of a matrix.
#
# Write the following functions:
#
#   - makeCacheMatrix: This function creates a special "matrix" object that can
#     cache its inverse.
#   - cacheSolve: This function computes the inverse of the special "matrix"
#     returned by makeCacheMatrix above. If the inverse has already been
#     calculated (and the matrix has not changed), then the cachesolve should
#     retrieve the inverse from the cache.
#
# Computing the inverse of a square matrix can be done with the solve function
# in R. For example, if X is a square invertible matrix, then solve(X) returns
# its inverse.
#
# For this assignment, assume that the matrix supplied is always invertible.
#
# In order to complete this assignment, you must do the following:
#
#   1 Fork the GitHub repository containing the stub R files at
#     https://github.com/rdpeng/ProgrammingAssignment2 to create a copy under your
#     own account.
#   2 Clone your forked GitHub repository to your computer so that you can edit
#     the files locally on your own machine.
#   3 Edit the R file contained in the git repository and place your solution in
#     that file (please do not rename the file).
#   4 Commit your completed R file into YOUR git repository and push your git
#     branch to the GitHub repository under your account.
#   5 Submit to Coursera the URL to your GitHub repository that contains the
#     completed R code for the assignment.
#
# In addition to submitting the URL for your GitHub repository, you will need to
# submit the 40 character SHA-1 hash (as string of numbers from 0-9 and letters
# from a-f) that identifies the repository commit that contains the version of
# the files you want to submit. You can do this in GitHub by doing the following
#
#   1 Going to your GitHub repository web page for this assignment
#   2 Click on the “?? commits” link where ?? is the number of commits you have
#     in the repository. For example, if you made a total of 10 commits to this
#     repository, the link should say “10 commits”.
#   3 You will see a list of commits that you have made to this repository. The
#     most recent commit is at the very top. If this represents the version of the
#     files you want to submit, then just click the “copy to clipboard” button on
#     the right hand side that should appear when you hover over the SHA-1 hash.
#     Paste this SHA-1 hash into the course web site when you submit your
#     assignment. If you don't want to use the most recent commit, then go down
#     and find the commit you want and copy the SHA-1 hash.
#
# A valid submission will look something like (this is just an example!)
#
# https://github.com/rdpeng/ProgrammingAssignment2
#
# 7c376cc5447f11537f8740af8e07d6facc3d9645
#
# Grading This assignment will be graded via peer assessment.  Please submit the
# URL pointing to your GitHub repository containing the completed R code for
# this assignment. (NOTE: Please submit the URL for the entire repository, not
# for any individual files.)
#
# On a separate line, submit the SHA-1 hash identifier corresponding to the
# commit that contains the full submission (the identifier should be a string of
# 40 characters containing numbers 0-9 and letters a-f).

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    # Initialize the inverse cache value
    i <- NULL
    # Create a setter for x (and init the cache)
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    # Create a getter for x
    get <- function() x
    # Create a setter and getter for the inverse
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    # Return the list of functions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    # If the cache already exists, return it
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    # Otherwise, perform the calculations and return it
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
    i
}

# To run it on the console:
# c <- rbind(c(1/3, 3/2), c(3/2, 1))
# m <- makeCacheMatrix(c)
# s <- cacheSolve(m)
# s
# s %*% c
# The last statement should return the identity matrix
# John Hopkin's University
## R-Programming Course
### Programming Assignment 2: Lexical Scoping
#### Notes for the reviewer:
As per the makeVector() function, makeMatrix does not accept pre-existing matrices as an argument, instead the matrix must be defined in-line using the matrix() function.
Example:

    # valid
    v <- makeMatrix(matrix(runif(25),5,5))
    # not valid
    v <- matrix(runif(25),5,5)
    mm <- makeMatrix(v)


No error handling for singular matrices has been included as per instructions:

> For this assignment, assume that the matrix supplied is always invertible

This is reproducible with the following:

    > mx <- makeMatrix(matrix(1:9, 3, 3))
    > cacheSolve(mx)
     Error in solve.default(data, ...) : 
    Lapack routine dgesv: system is exactly singular: U[3,3] = 0

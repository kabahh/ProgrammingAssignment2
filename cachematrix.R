## User-Defined Function to Calculate the Inverse of a Square Matrix
### Comments walk through function, explaining each piece

## "makeCacheMatrix" creates a list object that caches the inverse of matrices it has 
## previously solved. This means that if the same matrix enters the function, instead of 
## resolving the matrix, it will simply pull the cached result. 

### In the first line, the "matrix()" command ensures that the data will be read in as a
### matrix

makeCacheMatrix <- function(x = matrix()) {

### Here, the function creates an empty object to eventual hold the inverse of the matrix
        m <- NULL

### "Set" is a function that will read in the matrix of interest
        set <- function(y) {
                x <<- y
                m <<- NULL
        }

### "Get" reads in and keeps the values of the matrix of interest for comparison at a later 
### date
        get <- function() x

### "Setsolve" is a function that contains the "solve" command that will calculate the inverse of the matrix
        setsolve <- function(solve) 

### Places the inverse of the matrix into the object "m"
	m <<- solve

### "Getsolve" reads "m" and cache the inverse of the matrix
        getsolve <- function() m

### Creates a list object that contains the different pieces of the makeCacheMatrix Function 
### This will be returned at the end of the function execution
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## "cacheSolve" can read in the list created by "makeCacheMatrix" and makes the determination of whether to 
## pull the cache inverse value or solve the matrix anew

## In the first line, the function allows for a new square matrix to be read in or reads in the list object
## from "makeCacheMatrix"

cacheSolve <- function(x, ...) {
        
### The next 4 lines of code determine what gets places into object m
### The function "getsolve" will be expressed and its value place in m
### If it is not null, the message will print onto the console

        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }

### "data" gets the values of the original matrix of interest
        data <- x$get()

### m is replaced with the inverse of the original matrix
        m <- solve(data, ...)

### Places the values of m in the "setsolve" line and resets the values of getsolve in the "makeCacheMatrix" ### function
        x$setsolve(m)

### Returns m, containing the inverse of the original square matrix
        m
}

## Final Product:

### makeCacheMatrix <- function(x = matrix()) {
###         m <- NULL
###         set <- function(y) {
###                 x <<- y
###                 m <<- NULL
###         }
###         get <- function() x
###         setsolve <- function(solve) m <<- solve
###         getsolve <- function() m
###         list(set = set, get = get,
###              setsolve = setsolve,
###              getsolve = getsolve)
### }

### cacheSolve <- function(x, ...) {
###         m <- x$getsolve()
###         if(!is.null(m)) {
###                 message("getting cached data")
###                 return(m)
###         }
###         data <- x$get()
###         m <- solve(data, ...)
###         x$setsolve(m)
###         m
### }


# Let us specify base image required to for our application
# usually we specify base images to build application
# just assume that we will get linux OS with golang installed in it
# to build and run go programs
FROM golang:1.18-alpine

# all the operations we do here are linux commands only
# basically it is like just you have some linux OS,
# the things you specify here just commands to fetch source code
# and run it

# create new directory app where 
# we we build our application
RUN mkdir /app

# add everything from current source to this container
ADD . /app

# from now onwards this would be our workdire where we would
# be performing all the operations
WORKDIR /app

## let us run go mod download command to pull in any dependencies
RUN go mod download

## let us now build 
RUN go build -o main .

## start command which kicks off
## this newly created binary executable
CMD ["/app/main"]
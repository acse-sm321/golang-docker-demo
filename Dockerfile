# The dockerfile for building image

# specify the base image
FROM golang:1.18-bullseye

# intalll the beego globally
RUN go install github.com/beego/bee/v2@latest

# environment for Go modules
ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

# create a folder for the application and makes it active
ENV APP_HOME /go/src/mathapp
RUN mkdir -p "$APP_HOME"

# expose the port for the web application
WORKDIR "$APP_HOME"
EXPOSE 8010
CMD ["bee","run"]

# guidance of the docker command
# remember to open the desktop before run the command
# to assist docker on macOS, maybe use brew install --cask docker
# ===============================================================
# docker build -t mathapp-development .
# docker run -it --rm -p 8010:8010 -v $PWD/src:/go/src/mathapp mathapp-development
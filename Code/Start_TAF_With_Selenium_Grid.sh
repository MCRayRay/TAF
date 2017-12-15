#!/usr/bin/env bash
# A script to build and to start the Test Automation Frame (TAF) container.

# Docker build command for TAF
echo "Starting to build TAF docker container"
build_record() {
  docker build -t taf .
}

build_record
echo -e $(docker build -t taf .) 

# Start Selenium Grid in docker.
echo ""
echo "Starting Selenium Grid in Docker with the following browsers:"
echo "Firefox and Chrome"
build_selenium_grid() {
  docker-compose up -d
}

build_selenium_grid
echo -e $(docker-compose up -d)
echo ""
echo "Open a browser to: http://localhost:4444/grid/console"

echo ""
echo "Launching the TAF container into the container shell"
echo "To execute a test type the following code below:"
echo "ruby main.rb Tests/TS_<filename>"
docker run --rm --network containeriseddevelopment_default -it --name taf -v "$(pwd)"/target:/app/Results:cached taf sh

# Exit the script.
exit $?
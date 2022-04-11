# Docker LAMP stack for oxid eshop

## Installation

Run `docker-compose up -d` and visit 
* [the web server](http://localhost:8080/)
* [the phpMyAdmin](http://localhost:5000/)
* [the oxid SetUp](http://localhost:8080/oxid/source/Setup)

## Commands

    # basic container handling:
    docker-compose build  -> builds all container and services, but dont start them
    docker-compose start  -> starts the containers
    docker-compose stop   -> stops the containers
    docker-compose restart -> restarts all containers; have in mind that changes in docker-compose.yml are not updated

    # advanced container handling:
    docker-compose up    # create and start all containers, with -d it detaches
    docker-compose down  # stop and remove all containers, networks, images and volumes
    docker-compose ps    # show the docker port mappings
    docker-compose up -d # update containers and start
    docker-compose up --build --force-recreate --no-deps # complete rebuild


### Questions/open decisions/ideas for improvement

* does it make more sense to put the docroot of the apache2 to /var/www/html/source?
* PROBLEM: apache runs as root, needs other user configured
* problem with user permissions, eg. files created in container, but writeable from host?
* put source/ in dockerignore to speed up build process
* own container for php-fpm?
* extra dir for vhost.conf
* useage of .env file for parameters such as mysql credentials, shop credentials, ...
* entrypoint scripts to setup shop
* why install xdebug 2.8.1 and not xdebug 3?
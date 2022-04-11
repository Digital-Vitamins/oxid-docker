# Docker LAMP stack for oxid eshop

## Installation

Run `docker-compose up` and visit 
* [the web server](http://localhost:8080/)
* [the phpMyAdmin](http://localhost:5000/)
* [the oxid SetUp](http://localhost:8080/oxid/source/Setup)


## Questions/open decisions/ideas for improvement

### Todo

* apache runs as root, needs other user configured
* problem with user permissions, eg. files created in container, but writeable from host?
* usage of .env file for parameters such as mysql credentials, shop credentials, ...

### Ideas

* own container for php-fpm?
* put source/ in dockerignore to speed up build process
* does it make more sense to put the docroot of the apache2 to /var/www/html/source?
* Why install xdebug 2.8.1 and not xdebug 3?
* entrypoint scripts to setup shop

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


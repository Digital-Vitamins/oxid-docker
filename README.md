# Docker LAMP stack for oxid eshop

## Installation

ATTENTION: this docker container things are only tested with Ubuntu 20.04! 

1. Install docker ([find more instructions here](https://docs.docker.com/get-docker/)).
2. Install docker-compose ([find more instructions here](https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64)).
3. Copy the `.env.dist` file into `.env` and fill the given things (find the information with `id` in a terminal). 
4. Run `docker-compose up --build` .
5. On your host go into the directory `docroot/oxid`
   * run `composer create-project --no-interaction oxid-esales/oxideshop-project . dev-b-6.4-ce`
   * [the oxid SetUp](http://localhost:8088/oxid/source/Setup) 
   * to install the shop
   * the database is called `oxid` see below

## Good to know

* [web server](http://localhost:8088/)
* [there is a phpMyAdmin](http://localhost:5000/)
* the database `oxid` credentials are 
  * host: `mysql-server`
  * user: oxid
  * password: oxid

## Questions/Open decisions/Ideas for improvement

### Todo

* apache runs as root, needs other user configured
* problem with user permissions, eg. files created in container, but writeable from host?
* usage of .env file for parameters such as mysql credentials, shop credentials, ...

### Ideas

* own container for php-fpm?
* put source/ in dockerignore to speed up build process
* does it make more sense to put the docroot of the apache2 to /var/www/html/source?
* entrypoint scripts to setup shop

## Some useful docker commands

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


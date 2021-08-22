Eco-Service E-commerce Web-App
=======

This is a computer science school project who allow visitor to purchase eco-services or eco-products online.


Installing and Running with Docker
-----------


### Requierements

On linux (these are needed packages to install):
* git
* docker
* docker-compose
* composer

On windows  (these are needed softwares to install):
* git (download and install from https://git-scm.com/download/win)
* docker (download and install from https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
* composer (download and install from https://getcomposer.org/download/)


### Installation

To built the environment you should use these commands:

```sh
# Clone the repository
git clone https://github.com/pac421/Eco-Service.git

# Move inside the repository folder
cd Eco-Service/

# Start all the docker containers (the -d option is not required but it allow you to start containers in background)
docker-compose up -d

# Move into the apache server container
docker exec -it www_docker_symfony bash

# Move inside the symfony app folder
cd project/

# Install all the symfony packages
composer install

# Create the database
php bin/console doctrine:database:create
```


If all previous commands was executed successfully, you can access:
* symfony app on http://127.0.0.1:8741/
* phpmyadmin on http://127.0.0.1:8080/ (ID: "root", PW: "pass4root")
* maildev on http://127.0.0.1:8081/

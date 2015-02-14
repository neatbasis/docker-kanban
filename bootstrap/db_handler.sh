#!/bin/bash

# this script will setup custom database configuration
# will be skipped by default
# TODO may be extended to use MySQL db as well

if [ "${DATABASE_DRIVER}" = "postgres" ]; then

  apt-get install -y php5-pgsql

  sed -i -e "s/'DB_DRIVER', 'sqlite'/'DB_DRIVER', '${DATABASE_DRIVER}'/g" config.default.php

  sed -i -e "s/'DB_USERNAME', 'root'/'DB_USERNAME', '${DATABASE_USER}'/g" config.default.php
  sed -i -e "s/'DB_PASSWORD', ''/'DB_DRIVER', '${DATABASE_PW}'/g" config.default.php
  
  sed -i -e "s/'DB_HOSTNAME', 'localhost'/'DB_DRIVER', '${DATABASE_HOST}'/g" config.default.php
  sed -i -e "s/'DB_NAME', 'kanboard'/'DB_NAME', '${DATABASE_NAME}'/g" config.default.php

fi
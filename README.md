# docker-kanban

    Dockerized task organization á la Kanban based upon [kanboard.net](http://kanboard.net)

# Quickstart

docker run -d -p 80:80 mkodockx/docker-kanban

# About

## What?

Kanboard is a simple visual task board web application.

Have a look at the official website [kanboard.net](http://kanboard.net/)

## License

License of kanboard.net is:

[GNU Affero General Public License version 3](http://www.gnu.org/licenses/agpl-3.0.txt)

### Summary

- Inspired by the [Kanban methodology](http://en.wikipedia.org/wiki/Kanban)
- Get a visual and clear overview of your project
- Multiple boards with the ability to drag and drop tasks
- Minimalist software, focus only on essential features (Less is more)
- Open source and self-hosted
- Super simple installation

### Live repository status

#### Travis CI

[![Build Status](https://travis-ci.org/fguillot/kanboard.svg)](https://travis-ci.org/fguillot/kanboard)

#### Scrutinizer CI

[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/fguillot/kanboard/badges/quality-score.png?s=2b6490781608657cc8c43d02285bfafb4f489528)](https://scrutinizer-ci.com/g/fguillot/kanboard/)

#### Heroku deployment

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Who?

kanboard.net is developed by [Frédéric Guillot](http://fredericguillot.com/)

## Where?

Find the official source code at [github/fguillot](https://github.com/fguillot/kanboard)

## FAQ

A kanboard.net related FAQ can be found at [kanboard.net/faq](http://kanboard.net/faq)

# Usage

## Setup

### Minimal

    docker run -d mkodockx/docker-kanban

### Suggested

    docker run -d --name kanban \
        -v /host/persistence/kanban/data:/var/www/html/data \
        -v /host/persistence/kanban/assets:/var/www/html/assets \
        -p 80:80 mkodockx/docker-kanban

## Volumes

### Data (optional)

The data volume allows to keep the contents created within the application persistent on the host.

### Assets (optional)

Within the assets volume mapping you can cutomize styling, fonts and pics of the app.

## External database

By default the container uses an embedded SQLite database. You may want to use a PostgreSQL database instead.

#### Database initialization

Run a database instance first

    docker run -d --name db-kanban \
                 -v /host/persistence/kanban/db:/data \
                 -e USER="kanban"\
                 -e DB="kanboard"\
                 -e PASS="secret"\
                 paintedfox/postgresql

#### Provide database to docker-kanban

    docker run -d --name srv-kanban \
        -v /host/persistence/kanban/data:/var/www/html/data \
        -v /host/persistence/kanban/assets:/var/www/html/assets \
        --link db-kanban:db \
        -e "DATABASE_DRIVER=postgres" \
        -e "DATABASE_USER=kanban" \
        -e "DATABASE_PW=secret" \
        -e "DATABASE_NAME=kanboard" \
        -p 80:80 mkodockx/docker-kanban

## Upgrade

- Stop running sessions

- Ensure having a backup of your content data to be able to fall back (e.g. by copying the [data volume](### Data) host representation path/directory)

- If you use own custom assets or changed the provided assets via [assets volume](### Assets), ensure to track them somehow as well

- Fetch the new container image from registry

    docker pull mkodockx/docker-kanban:latest

- Start the image as usual providing your [data folder](### Data) from the last version

- You may need to change its contents in case of data structure modifications

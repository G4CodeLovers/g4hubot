#!/bin/bash

set -e

if [ ! $1 ]; then
	echo " Example of use: source upgrade.sh production"
fi

if [ $1 ]; then
	cd /var/www/hubot/current
        git pull origin master
	npm install
	export PATH="node_modules/.bin:node_modules/hubot/node_modules/.bin:$PATH"
	pm2 startOrRestart /var/www/hubot/current/pm2.$1.json
fi

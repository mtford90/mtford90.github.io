#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"
CURR_DIR=`pwd`
cd "${DIR}/../"
jekyll build --config _config.prod.yml
cd _site
git commit -a -m "Automated commit"
git push origin gh-pages
cd ${CURR_DIR}
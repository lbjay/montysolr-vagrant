#!/usr/bin/env bash

# supress post-install config dialogs
export DEBIAN_FRONTEND=noninteractive

aptitude update
aptitude install -y git vim wget openjdk-7-jdk ant screen python-virtualenv libmysqlclient-dev gcc \
 libmysqlclient-dev libxml2-dev python-dev python-libxml2 libxslt-dev subversion g++ \
 gettext mysql-client netpbm pstotext giflib-tools html2text pdftk gs-common gnuplot \
 apache2-mpm-prefork mysql-server poppler-utils clisp libapache2-mod-wsgi unzip

. /var/lib/montysolr/run-perpetuum-check.sh

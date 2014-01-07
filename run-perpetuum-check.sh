#!/bin/bash -e


# This script is invoked periodically, it in turn
# invokes the update script that knows how to check
# montysolr changes, and install the newest version
# when necessary

# By default, we build inside /var/lib/montysolr, it
# can be changed through envar MONTYSOLR_HOME

cd /var/lib/montysolr


# let's download the montysolr-updater if not there already

if [ ! -e montysolrupdate.py ]; then
   wget -nc https://raw.github.com/romanchyla/montysolr/master/contrib/examples/src/python/montysolrupdate.py
   wget -nc https://raw.github.com/romanchyla/montysolr/master/contrib/examples/src/python/test_montysolrupdate.py
fi


# These two env properties are what is necessary for 
# building montysolr

export INVENIO_COMMIT=9a763ba
export ANT_HOME=/usr/share/ant
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64

if [ -e invenio-local.conf ]; then
    export INVENIO_CONFIG=`cat invenio-local.conf`
fi

# This command will setup the environment, if necessary
# and then build/deploy 3 montysolr instances. One is
# write master, the other two are master-searchers
# If you change the instance names-ports, the update
# script will build them, but it doesn't know how to stop
# them. So, don't do it! Once you picked up names and 
# port, stick to them!!!

python montysolrupdate.py -a -c -u -t 60 -x $1 dev-9001

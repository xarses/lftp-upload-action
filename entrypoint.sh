#!/bin/sh -l

SSL_VERIFY_CERT=${SSL_VERIFY_CERT:-true}
SSL_FORCE=${SSL_FORCE:-false}

# "NORMAL:%COMPAT:+VERS-TLS1.0"
#SSL_PRIORITY=${SSL_PRIORITY}

URI=${PROTOCOL:=ftp}://$HOST

if [ ! -n $PORT ]; then
    URI=$URI:$PORT
fi

#USERNAME
#PASSWORD
#ARGS
#REMOTE_PATH
#LOCAL_PATH

ARGS=${ARGS}

lftp $URI <<- TRANSFER
    set ssl:priority ${SSL_PRIORITY}
    set ssl:verify-certificate ${SSL_VERIFY_CERT}
    set ftp:ssl-force ${SSL_FORCE}
    user $USERNAME $PASSWORD

    #--reverse sends file to the server from the LOCAL_PATH
    mirror --verbose --reverse $ARGS $LOCAL_PATH $REMOTE_PATH
TRANSFER

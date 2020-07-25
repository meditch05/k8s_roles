#!/bin/bash

HTPASSWD=`docker run --entrypoint htpasswd registry:2 -Bbn webwas alskfl12~! | grep -v "^$"` 

echo $HTPASSWD

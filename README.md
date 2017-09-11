# nginx-unit-php

# Build 
 - docker build -t nginx-unit-php:test .
# Running
 - docker run -d  -p 80:80 --name php-web nginx-unit-php:test
# Reconfig
 - docker exec -it php-web curl -X PUT -d @/conf/server.json --unix-socket /var/run/control.unit.sock http://localhost/

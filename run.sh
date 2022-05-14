#!/bin/bash
if [ -z ${PORT+x} ]; then
    PORT=8080
fi

java -Dfile.encoding=utf-8 -Dtabula.disable_version_check=1 -Dtabula.disable_notifications=1 -Dwarbler.port=$PORT -jar ~/tabula/tabula.jar
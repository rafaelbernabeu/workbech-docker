#!/bin/bash

docker run -ti --name workbench -v /media:/media -v /home/rab:/home/rab -p 8080:8080 -p 9002:9002 -p 4200:4200 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix rbbernabeu/workbench

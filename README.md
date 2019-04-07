# workbench-docker

For Windows Hosts:

Install Xming: https://sourceforge.net/projects/xming/

Open XServer.

Execute docker run with the argumments:
```bash
# docker run ..... -e DISPLAY=YOUR_IP:0.0 .....
```


_________

For Linux Hosts:

Run this command on the host machine to allow clients to connect from any host:
```bash
xhost +
```
Execute docker run with the argumments:
```bash
docker run ..... -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix .....
```
To get sound out of the container:
```bash
--device=/dev/snd:/dev/snd
```

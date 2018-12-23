cmd /k docker run -ti --name workbench -v c:/:/c -v d:/:/d -p 8080:8080 -p 9002:9002 -e DISPLAY=192.168.0.7:0.0 rbbernabeu/workbench

cmd /k docker run -ti --name workbench -v c:/:/c -v d:/:/d -p 8080:8080 -p 4200:4200 -e DISPLAY=192.168.0.9:0.0 rbbernabeu/workbench

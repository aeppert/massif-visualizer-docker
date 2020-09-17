# must have X11 server such as vcxsrv installed and running
docker run -d -ti --rm -e DISPLAY=host.docker.internal:0 -v $env:TEMP/massif-files:/home/massif/test aeppert/massif-visualizer

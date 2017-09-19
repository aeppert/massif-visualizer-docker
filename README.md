# massif-visualizer-docker
massif-visualizer Docker Container Source

## Usage:

`valgrind --tool=massif --time-unit=ms ./executable`

With the current `run-massif-visualizer.sh`, it assumes the resulting `massif.*` files are in `/tmp/massif-tests`. From there, you can open the tests in `/home/massif/test` within the massif-visualizer X11 window.

## Docker

`docker pull aeppert/massif-visualizer:latest`

*Note*, you will still, likely want to use `run-massif-visualizer.sh` in order to interact with the container easily.

# massif-visualizer-docker
massif-visualizer Docker Container Source

## Usage:

`valgrind --tool=massif --time-unit=ms ./executable`

With the current `run-massif-visualizer.sh`, it assumes the resulting `massif.*` files are in `/tmp/massif-tests`. From there, you can open the tests in `/home/massif/test` within the massif-visualizer X11 window.

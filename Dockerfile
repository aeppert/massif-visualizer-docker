FROM debian:stretch
LABEL maintainer "Aaron Eppert <aaron@eppert.co>"

RUN apt-get update && apt-get install -y \
	massif-visualizer \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /src/*.deb

RUN groupadd -r massif && useradd -r -g massif massif \
    && mkdir -p /home/massif/test && chown -R massif:massif /home/massif

USER massif

ENTRYPOINT [ "massif-visualizer" ]

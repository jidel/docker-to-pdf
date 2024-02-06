FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND noninteractive

# Install Microsoft fonts and libreoffice
RUN echo "deb http://deb.debian.org/debian bookworm contrib" > /etc/apt/sources.list.d/contrib.list \
    && apt-get update \
    && apt-get install -q -y libreoffice ttf-mscorefonts-installer \
    && apt-get remove -q -y libreoffice-gnome

# Add additional fonts
COPY ./fonts /usr/share/fonts/truetype
RUN cd /usr/share/fonts/truetype \
    mkfontscale \
    mkfontdir \
    fc-cache \
    xset fp rehash

# Add non-root user
RUN useradd --create-home --shell /bin/bash topdf

USER topdf
WORKDIR /home/topdf

CMD cat - > input_file \ 
    && libreoffice --invisible --headless --nologo --convert-to pdf --outdir $(pwd) input_file > /dev/null 2>&1 \
    && cat input_file.pdf
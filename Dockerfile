FROM resin/rpi-raspbian

LABEL maintainer="voldedore"

ENV VERSION 0.2.2

# Workaround for resolvconf issue
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

# Add mirror for vietnam location & Install prerequisite
RUN echo "deb http://mirrors.vinahost.vn/raspbian/raspbian jessie main contrib non-free rpi firmware" >> /etc/apt/sources.list && \
  apt-get update && apt-get install apt-utils wget dialog

# Add OMV repo
RUN echo "deb http://packages.openmediavault.org/public erasmus main" | sudo tee -a /etc/apt/sources.list.d/openmediavault.list && \
  wget -O - http://packages.openmediavault.org/public/archive.key | apt-key add -

# Install OMV
RUN apt-get update && apt-get install openmediavault

# Install OMV Extras
RUN wget http://omv-extras.org/debian/pool/main/o/openmediavault-omvextrasorg/openmediavault-omvextrasorg_3.3.3_all.deb && \
  dpkg -i openmediavault-omvextrasorg_3.3.3_all.deb

# Install plugins
# Transmission BitTorrent
RUN apt-get install openmediavault-transmissionbt
# Add created user to `users` group
RUN usermod -a -G users debian-transmission

# Persistence volume:
VOLUME ["/data"]

# Command
CMD ["/bin/bash"]

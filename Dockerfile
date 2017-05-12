FROM ubuntu:latest
MAINTAINER beta

# Install components
RUN sudo apt-get update
RUN sudo apt-get -y install apache2
RUN useradd -m -s /bin/nologin deluge
RUN touch /var/log/deluged.log
RUN touch /var/log/deluge-web.log
RUN chown deluge:deluge /var/log/deluge*
RUN sudo apt-get update
RUN sudo apt-get -y install deluged
RUN sudo apt-get -y install deluge-webui
ADD default /etc/
ADD init.d /etc/
RUN chmod a+x /etc/init.d/deluge-daemon
RUN update-rc.d deluge-daemon defaults
RUN chmod 444 /var/www/html

WORKDIR /home/deluge

# Expose ports
EXPOSE 80
EXPOSE 8112
EXPOSE 58846
EXPOSE 58847
EXPOSE 58847/udp

VOLUME /home/deluge
CMD ["runsvdir", "/etc/service"]

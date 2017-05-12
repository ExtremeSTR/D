FROM debian:jessie
MAINTAINER Jake <i@am.so-aweso.me>

# Install components
RUN apt-get update
RUN apt-get install wget
RUN apt-get -y install apache2
RUN useradd -m -s /bin/nologin deluge
RUN touch /var/log/deluged.log
RUN touch /var/log/deluge-web.log
RUN chown deluge:deluge /var/log/deluge*
RUN apt-get update
RUN apt-get -y install deluged
RUN apt-get -y install deluge-webui
RUN wget --output-document="/etc/default/deluge-daemon" https://raw.githubusercontent.com/ExtremeSTR/deluge-installer/master/etc/default/deluge-daemon
RUN wget --output-document="/etc/init.d/deluge-daemon" https://raw.githubusercontent.com/ExtremeSTR/deluge-installer/master/etc/init.d/deluge-daemon
RUN chmod a+x /etc/init.d/deluge-daemon
Run update-rc.d deluge-daemon defaults
Run chmod 777 /var/www/html

WORKDIR /home/deluge

# Expose ports
EXPOSE 80
EXPOSE 8112
EXPOSE 58846
EXPOSE 58847
EXPOSE 58847/udp

VOLUME /home/deluge
CMD ["runsvdir", "/etc/service"]

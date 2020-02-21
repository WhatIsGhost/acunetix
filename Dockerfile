FROM kalilinux/kali-linux-docker

RUN apt-get update -y && \
    apt-get -y install libxdamage1 libgtk-3-0 libasound2 libnss3 libxss1 sudo bzip2 wget expect

RUN cd /tmp && wget https://gitlab.com/mtsec/tes123t/-/raw/master/acunetix_13.0.200217097_x64_.sh && chmod +x /tmp/acunetix_13.0.200217097_x64_.sh

ADD install.expect /tmp/install.expect
ADD wvsc /tmp/wvsc
ADD license_info /tmp/license_info
RUN cd /tmp && chmod +x /tmp/install.expect && /tmp/install.expect

CMD su -l acunetix -c /home/acunetix/.acunetix_trial/start.sh
RUN cp /tmp/wvsc /home/acunetix/.acunetix/v_200217097/scanner/
RUN cp /tmp/license_info.json /home/acunetix/.acunetix/data/license/

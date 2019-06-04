FROM balenalib/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install build-essential subversion automake autoconf telnet libxml2-dev && \
    mkdir openv && \
    cd openv && \
    svn checkout svn://svn.code.sf.net/p/vcontrold/code/trunk vcontrold-code && \
    cd vcontrold-code/vcontrold && \
    chmod +x auto-build.sh && \
    ./auto-build.sh && \
    ./configure && \
    make && \
    make install 

ADD vcontrold.xml /etc/vcontrold/
ADD vito.xml /etc/vcontrold/
ADD startup.sh /

ENTRYPOINT ["/startup.sh"]


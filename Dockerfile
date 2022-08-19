FROM debian:stable-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential git cmake telnet libxml2-dev && \    
    mkdir openv && \
    cd openv && \
    git clone https://github.com/openv/vcontrold.git && \
    cd vcontrold && \
    mkdir build && \
    cd build && \
    cmake -DMANPAGES=OFF .. && \
    make install

ADD vcontrold.xml /etc/vcontrold/
ADD vito.xml /etc/vcontrold/
ADD startup.sh /

ENTRYPOINT ["/startup.sh"]


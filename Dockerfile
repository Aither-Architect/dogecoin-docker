FROM ubuntu:20.04

RUN apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates \
  wget \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /wowmuchdocker
  
RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-x86_64-linux-gnu.tar.gz && \
    tar -xvzf ./dogecoin-1.14.3-x86_64-linux-gnu.tar.gz && \
    rm ./dogecoin-1.14.3-x86_64-linux-gnu.tar.gz && \
    cd dogecoin-1.14.3 && \
    mkdir data

CMD ["/wowmuchdocker/dogecoin-1.14.3/bin/dogecoind", "-conf=/etc/dogecoin.conf", "-printtoconsole"]

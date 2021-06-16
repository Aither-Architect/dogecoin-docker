FROM ubuntu:20.04

RUN apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates \
  wget \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /wowmuchdocker
  
RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-x86_64-linux-gnu.tar.gz && \
    wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-aarch64-linux-gnu.tar.gz && \
    mkdir x86_64 && \
    mkdir aarch64 && \
    tar -xvzf ./dogecoin-1.14.3-x86_64-linux-gnu.tar.gz -C ./x86_64 && \
    tar -xvzf ./dogecoin-1.14.3-aarch64-linux-gnu.tar.gz -C ./aarch64 && \
    rm ./dogecoin-1.14.3-x86_64-linux-gnu.tar.gz && \
    rm ./dogecoin-1.14.3-aarch64-linux-gnu.tar.gz && \
    cd ./x86_64/dogecoin-1.14.3 && \
    mkdir data && \
    cd ../.. && \
    cd ./aarch64/dogecoin-1.14.3 && \
    mkdir data && \
    cd ../..

CMD ["/wowmuchdocker/${ARCH}/dogecoin-1.14.3/bin/dogecoind", "-conf=/etc/dogecoin.conf", "-printtoconsole"]

FROM debian:buster-slim
RUN apt update && apt upgrade -y && apt install -y make gcc autoconf flex wget && \ 
  wget https://github.com/johnkerl/miller/archive/refs/tags/v5.10.2.tar.gz && \
    tar -xf v5.10.2.tar.gz && \
    cd miller-5.10.2/ && \
    ./configure && \
    make && \
    make check && \
    make install && \
    cd .. && rm -rf miller-5.10.2 && \
  apt remove --purge -y make gcc autoconf wget $(apt-mark showauto) && \
  rm -rf /var/lib/apt/lists/* && \
  apt clean
ENTRYPOINT ["mlr"]

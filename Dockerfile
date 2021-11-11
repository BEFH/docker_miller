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
  apt remove --purge -y remove -y autoconf automake autotools-dev \
      binutils-x86-64-linux-gnu cpp cpp-8 gcc gcc-8 libasan5 libatomic1 \
      libbinutils libc-dev-bin libc6-dev libcc1-0 libfl-dev libfl2 \
      libgcc-8-dev libgomp1 libisl19 libitm1 liblsan0 libmpc3 libmpfr6 \
      libmpx2 libquadmath0 libsigsegv2 libtsan0 libubsan1 linux-libc-dev \
      manpages-dev wget binutils binutils-common && \
  rm -rf /var/lib/apt/lists/* && \
  apt clean
ENTRYPOINT ["mlr"]

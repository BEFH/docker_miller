FROM debian:buster-slim
RUN mkdir setup
RUN apt update && apt upgrade -y && apt install -y make gcc autoconf flex 
RUN cd setup
RUN wget https://github.com/johnkerl/miller/archive/refs/tags/v5.10.2.tar.gz && \
  tar -xf v5.10.2.tar.gz && \
  cd miller-5.10.2/ && \
  ./configure && \
  make && \
  make check && \
  make install && \
  cd ..
RUN cd .. && rm -rf setup
RUN apt remove autoconf automake autotools-dev binutils binutils-common \
      binutils-x86-64-linux-gnu cpp cpp-8 gcc gcc-8 libasan5 libatomic1 \
      libbinutils libc-dev-bin libc6-dev libcc1-0 libfl-dev libfl2 \
      libgcc-8-dev libgomp1 libisl19 libitm1 liblsan0 libmpc3 libmpfr6 \
      libmpx2 libquadmath0 libsigsegv2 libtsan0 libubsan1 linux-libc-dev \
      manpages-dev && \
  apt clean
ENTRYPOINT ["mlr"]

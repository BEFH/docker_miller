FROM alpine:3.14
RUN mkdir setup
RUN apk add --no-cache gcc make wget autoconf flex musl-dev
RUN cd setup
RUN wget https://github.com/johnkerl/miller/archive/refs/tags/v5.10.2.tar.gz && \
  tar -xf v5.10.2.tar.gz && \
  cd miller-5.10.2/ && \
  ./configure && \
  make && \
  make check &&
  make install && \
  cd ..
RUN cd .. && rm -rf setup
RUN apk del gcc make wget autoconf musl-dev
ENTRYPOINT ["mlr"]

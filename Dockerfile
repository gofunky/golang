ARG GOVERSION=latest
FROM golang:${GOVERSION}
MAINTAINER matfax <mat@fax.fyi>

USER root
RUN mkdir -pv /root
ENV HOME /root

RUN mkdir -pv /go/tmp
ENV GOTMPDIR /go/tmp

COPY ./musl /usr/local/musl
COPY ./upx /usr/local/bin
COPY ./fossa /usr/local/bin/fossa

ARG GOVERSION
ARG BUILD_DATE
ARG VCS_REF

RUN apt-get update && \
    apt-get install -y --no-install-recommends git unison ca-certificates gcc make binutils && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O - https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN go get github.com/jstemmer/go-junit-report
RUN go get github.com/haya14busa/goverage
RUN go get github.com/schrej/godacov

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/gofunky/golang" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$GOVERSION \
      org.label-schema.schema-version="1.0"

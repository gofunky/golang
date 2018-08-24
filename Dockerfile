ARG GOVERSION=latest
FROM golang:${GOVERSION}
MAINTAINER matfax <mat@fax.fyi>

apk add --no-cache make

ARG GOVERSION
ARG BUILD_DATE
ARG VCS_REF

RUN wget -O - https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN go get github.com/jstemmer/go-junit-report
RUN go get github.com/haya14busa/goverage
RUN go get github.com/schrej/godacov
COPY ./fossa /usr/local/bin/fossa

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/gofunky/golang" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$GOVERSION \
      org.label-schema.schema-version="1.0"

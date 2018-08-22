ARG GOVERSION=latest
FROM circleci/golang:${GOVERSION}
MAINTAINER matfax <mat@fax.fyi>

ARG GOVERSION
ARG BUILD_DATE
ARG VCS_REF

RUN go get github.com/jstemmer/go-junit-report
RUN go get github.com/haya14busa/goverage
RUN go get github.com/schrej/godacov

ADD https://raw.githubusercontent.com/fossas/fossa-cli/master/install.sh /tmp/install.sh
RUN sudo chmod +x /tmp/install.sh && \
    sudo /tmp/install.sh

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/gofunky/golang" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$GOVERSION \
      org.label-schema.schema-version="1.0"

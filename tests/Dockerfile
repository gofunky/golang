FROM gofunky/golang
MAINTAINER matfax <mat@fax.fyi>

WORKDIR /app

ADD . /app
RUN chmod +x sut.sh

CMD ["./sut.sh"]

FROM golang:1.7

RUN go get github.com/Masterminds/glide

WORKDIR /go/src/github.com/ory-am/hydra
ADD ./glide.yaml /go/src/github.com/ory-am/hydra/glide.yaml
ADD ./glide.lock /go/src/github.com/ory-am/hydra/glide.lock
RUN glide install

ADD . /go/src/github.com/ory-am/hydra
RUN go install github.com/ory-am/hydra

ENTRYPOINT /go/bin/hydra host

EXPOSE 4444
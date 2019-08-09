FROM golang:1.12.7-alpine3.10 AS builder
RUN apk --no-cache add git
RUN go get github.com/wakeful/yaml2json
RUN go get github.com/santhosh-tekuri/jsonschema/cmd/jv

FROM alpine:3.10
WORKDIR /root/
COPY --from=builder /go/bin/yaml2json /usr/local/bin
COPY --from=builder /go/bin/jv /usr/local/bin

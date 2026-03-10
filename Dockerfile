FROM golang:alpine AS builder

RUN apk add --no-cache git
WORKDIR /go/markscribe
RUN git clone https://github.com/popey/markscribe.git . && go build

FROM alpine

COPY --from=builder /go/markscribe/markscribe /go/bin/markscribe

ENTRYPOINT ["/go/bin/markscribe"]

FROM golang AS gl
WORKDIR /go
COPY src /go/src
RUN go build  /go/src/main.go
FROM ubuntu
COPY --from=gl /go/main .
CMD ["./main"]

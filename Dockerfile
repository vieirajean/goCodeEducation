FROM golang:1.12.0-alpine3.9 AS build

WORKDIR /src/
COPY ./src/main.go go.* /src/
RUN go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
CMD ["/bin/demo"]
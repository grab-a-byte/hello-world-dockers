FROM golang:alpine AS build

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN go build -o /build/hello-go


FROM scratch

COPY --from=build /build/hello-go ./

ENTRYPOINT  ["./hello-go"]
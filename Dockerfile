FROM golang:1.16.3-alpine AS build

WORKDIR /go/app

ADD . .

RUN go mod init treinamento
RUN CGO_ENABLED=0 go build -o app

FROM scratch AS bin
COPY --from=build /go/app/app /app
ENTRYPOINT ["/app"]


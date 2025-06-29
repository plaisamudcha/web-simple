FROM golang:1.25rc1-bullseye

WORKDIR /app

COPY . .

RUN go build -o api

EXPOSE 8080

CMD ["./api"]
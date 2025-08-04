# Build stage
FROM golang:1.24-alpine3.22 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go
RUN go install github.com/pressly/goose/v3/cmd/goose@latest
ENV PATH="/root/go/bin:$PATH"


# Run stage
FROM alpine:3.22
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /go/bin/goose ./goose
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
RUN chmod +x /app/start.sh
COPY db/migration ./migration




EXPOSE 8080
ENTRYPOINT [ "/app/start.sh"]
CMD [ "/app/main" ]
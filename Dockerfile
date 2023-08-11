# Estágio de construção
FROM golang:1.20-alpine AS build

WORKDIR /app
COPY hello.go .
RUN go mod init hello.go 
RUN CGO_ENABLED=0 GOOS=linux go build -o hello

# Estágio final
FROM scratch

COPY --from=build /app/hello /

CMD ["/hello"]

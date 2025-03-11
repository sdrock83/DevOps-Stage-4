FROM golang:1.19-alpine AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o auth-api .

FROM alpine:3.17
COPY --from=build /app/auth-api /usr/local/bin/
EXPOSE 8000
CMD ["auth-api"]

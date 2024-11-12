FROM golang:1.21 as build

WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 go build -o /app/main .

FROM gcr.io/distroless/static-debian12
RUN cat /dev/urandom tr -dc 'A-Z' | head -c 12 > /app/random_number

COPY --from=build /app/main /app/main
CMD ["/app/main"]

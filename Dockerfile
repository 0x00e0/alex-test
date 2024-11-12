FROM golang:1.21 as build

WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o /app/main .

FROM gcr.io/distroless/static-debian12
COPY /app/ /tmp/
COPY --from=build /app/main /app/main
CMD ["/app/main"]

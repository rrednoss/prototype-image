FROM golang:1.16-buster as builder
WORKDIR /app
COPY . /app/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -a -o main

FROM scratch
LABEL org.opencontainers.image.created=""
LABEL org.opencontainers.image.authors="Rene Rednoß (https://github.com/rrednoss)"
LABEL org.opencontainers.image.url="https://github.com/rrednoss/prototype-image"
LABEL org.opencontainers.image.documentation="https://github.com/rrednoss/prototype-image"
LABEL org.opencontainers.image.source="https://github.com/rrednoss/prototype-image"
LABEL org.opencontainers.image.version="v1.0.0"
LABEL org.opencontainers.image.revision=""
LABEL org.opencontainers.image.vendor="Rene Rednoß"
LABEL org.opencontainers.image.licenses="MIT License"
LABEL org.opencontainers.image.ref.name="rrednoss/prototype-image"
LABEL org.opencontainers.image.title="prototype-image"
LABEL org.opencontainers.image.description="A simple HTTP server that can be used as a placeholder in prototype Kubernetes configurations."
LABEL org.opencontainers.image.base.digest=""
LABEL org.opencontainers.image.base.name=""
COPY --from=builder /app/main .
EXPOSE 8000/tcp
ENTRYPOINT ["/main"]

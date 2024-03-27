FROM golang:1.22-alpine

ENV CGO_ENABLED=0 \
    GO111MODULE=on \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app

# Setup air hot reloader
RUN wget https://github.com/cosmtrek/air/releases/download/v1.51.0/air_1.51.0_linux_amd64 -O air && \
    chmod +x air && \
    mv ./air /bin/air

# Set CLI binary on PATH
ENV PATH="$PATH:/app/envs/dev/tmp"

CMD [ "air", "-c", "./envs/dev/cli.air.toml" ]

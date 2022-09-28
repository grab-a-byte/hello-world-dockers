FROM rust:1.64 as builder
WORKDIR /
COPY . .
RUN cargo install --path /

FROM debian:bullseye-slim
RUN rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/rustthing /usr/local/bin/rustthing
CMD ["rustthing"]
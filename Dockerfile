FROM docker.io/alpine:3.19 as builder
RUN apk --no-cache add cargo
RUN cargo install minijinja-cli

FROM docker.io/alpine:3.19
RUN apk --no-cache add libgcc
COPY --from=builder /root/.cargo/bin/minijinja-cli /usr/local/bin/minijinja-cli

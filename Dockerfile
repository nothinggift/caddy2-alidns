FROM caddy:2.5.1-builder-alpine AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/alidns \
  --with github.com/kirsch33/realip


FROM caddy:2.5.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--environ", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

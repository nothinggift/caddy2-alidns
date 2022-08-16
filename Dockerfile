FROM caddy:2.5.2-builder-alpine AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/alidns


FROM caddy:2.5.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN apk update && apk add nano && apk add bash

CMD ["caddy", "run", "--environ", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

FROM caddy:2-alpine

WORKDIR /app

COPY run.sh /app/run.sh

RUN chmod +x /app/run.sh

RUN apk add --no-cache coreutils
CMD ["sh", "/app/run.sh"]
FROM alpine:3.20

RUN apk add --no-cache curl ca-certificates libc6-compat

WORKDIR /app

# Download official WriteFreely release
RUN curl -s -L https://github.com/writefreely/writefreely/releases/download/v0.17.2/writefreely_0.17.2_linux_amd64.tar.gz | tar -xzf - --strip-components=1

# Copy translated templates and pages (pt-BR)
COPY templates/ /app/templates/
COPY pages/ /app/pages/

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/app/entrypoint.sh"]

FROM nginx:alpine
ARG TZ=Asia/Tokyo

LABEL maintainer="yuruto"
LABEL description="build nginx"

# Install
RUN    apk --no-cache update \
    && apk --no-cache add bash tzdata gettext \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && mkdir -p /etc/nginx/template \
    && mkdir -p /data \
    && rm -rf /var/cache/apk/*

# Set environment
ENV SERVER_HOSTNAME=10.0.16.2 \
    SERVER_PORT=8080

COPY ./execute.sh /execute.sh
RUN chmod 755 /execute.sh

CMD ["/execute.sh"]

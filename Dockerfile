FROM alpine:3

RUN apk update && apk upgrade --no-cache && \
    apk add \
        ruby \
        wget \
        procps \
        curl-dev \
        pcre-dev \
        ruby-dev \
        ruby-bundler \
        ruby-full \
        xz-libs \
        yarn \
        nodejs \
        postgresql-client \
        libffi-dev \
        readline \
        build-base \
        postgresql-dev \
        linux-headers \
        libxml2-dev \
        libxslt-dev \
        readline-dev \
        gcc \
        libc-dev \
        --update \
        --no-cache

RUN gem i passenger && \
          passenger-config compile-agent --auto --optimize && \
          passenger-config install-standalone-runtime --auto && \
          passenger-config build-native-support && \
          passenger-config validate-install --auto

RUN apk del --purge tzdata \
                    libffi-dev \
                    build-base \
                    postgresql-dev \
                    linux-headers \
                    libxml2-dev \
                    libxslt-dev \
                    readline-dev \
                    gcc \
                    libc-dev \
    && rm -rf /var/cache/apk/* /tmp/*


ENV APP_HOME /app
ENV PORT 3000

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
RUN chmod +x entrypoint.sh

EXPOSE $PORT

ENV RACK_ENV production
ENV PASSENGER_MIN_INSTANCES 5
ENV PASSENGER_DISABLE_SECURITY_UPDATE_CHECK true
ENV PASSENGER_LOG_FILE /dev/stdout
ENV PASSENGER_FRIENDLY_ERROR_PAGES true

# Start the main process.
ENTRYPOINT ["./entrypoint.sh"]
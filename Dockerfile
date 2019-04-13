FROM docker:stable

WORKDIR /app
ADD docker-entrypoint.sh cleanup.sh ./

ENV CLEANUP_RATE 86400

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
FROM nginx:stable

COPY default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

RUN chown -R 1001:1001 /app && chmod -R 755 /app && \
        chown -R 1001:1001 /var/cache/nginx && \
        chown -R 1001:1001 /var/log/nginx && \
        chown -R 1001:1001 /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R 1001:1001 /var/run/nginx.pid

EXPOSE 8000
USER 1001
CMD ["nginx", "-g", "daemon off;"]
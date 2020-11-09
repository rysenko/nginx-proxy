FROM jwilder/nginx-proxy
ENV MAX_BODY_SIZE=50m
ENV TIMEOUT=60
RUN { \ 
    sed -i 's/\(worker_connections\s*\)[0-9]*;/\110000;/' /etc/nginx/nginx.conf; \
}
CMD { \
    echo "server_tokens off;"; \
    echo "client_max_body_size ${MAX_BODY_SIZE};"; \
    echo "proxy_connect_timeout ${TIMEOUT};"; \
    echo "proxy_send_timeout ${TIMEOUT};"; \
    echo "proxy_read_timeout ${TIMEOUT};"; \
    echo "send_timeout ${TIMEOUT};"; \
} > /etc/nginx/conf.d/my_proxy.conf && forego start -r

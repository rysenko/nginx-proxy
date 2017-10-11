FROM jwilder/nginx-proxy
ENV MAX_BODY_SIZE=8m
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size ${MAX_BODY_SIZE};'; \
    } > /etc/nginx/conf.d/my_proxy.conf

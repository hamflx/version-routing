FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY website/ /usr/share/nginx/html/

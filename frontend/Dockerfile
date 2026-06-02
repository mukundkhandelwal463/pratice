FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY index.html style.css app.js ./

RUN printf '%s\n' \
  'server {' \
  '  listen 80;' \
  '  server_name localhost;' \
  '' \
  '  location / {' \
  '    root /usr/share/nginx/html;' \
  '    index index.html;' \
  '    try_files $uri $uri/ /index.html;' \
  '  }' \
  '' \
  '  location /api/ {' \
  '    proxy_pass http://backend:3000/api/;' \
  '  }' \
  '}' \
  > /etc/nginx/conf.d/default.conf

EXPOSE 80

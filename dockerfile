FROM nginx:alpine

RUN apk add --no-cache nginx openssl

COPY ssl/your_domain_chain.crt /etc/ssl/certs/
COPY ssl/eduardoos_com.key /etc/ssl/private/

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
RUN nginx -t

COPY ui/dist /usr/share/nginx/html

RUN chmod -R 755 usr/share/nginx/html
RUN chmod -R 755 usr/share/nginx/html/*

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
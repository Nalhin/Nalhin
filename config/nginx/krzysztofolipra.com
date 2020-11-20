server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

    root /var/www/krzysztofolipra.com;

    index index.html index.htm index.nginx-debial.html;

    server_name krzysztofolipra.com www.krzysztofolipra.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
        include /etc/nginx/proxy_params;
    }
}

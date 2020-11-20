server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;


    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

    root /var/www/krzysztofolipra.com/Imgur/build;

    index index.html index.htm index.nginx-debial.html;

    server_name imgur.krzysztofolipra.com www.imgur.krzysztofolipra.com;

    location / {
        try_files $uri $uri/ /index.html;
    }
}

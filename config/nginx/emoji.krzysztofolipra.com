server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

    root /var/www/krzysztofolipra.com/Emoji/build;

    index index.html index.htm index.nginx-debial.html;

    server_name emoji.krzysztofolipra.com www.emoji.krzysztofolipra.com;

    location / {
        try_files $uri $uri/ =404;
    }
}

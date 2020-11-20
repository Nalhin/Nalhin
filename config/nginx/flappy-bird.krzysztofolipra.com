server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

    root /var/www/krzysztofolipra.com/FlappyBird;

    index index.html index.htm index.nginx-debial.html;

    server_name flappy-bird.krzysztofolipra.com www.flappy-bird.krzysztofolipra.com;

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

    server_name api-pokemon-teams.krzysztofolipra.com www.api-pokemon-teams.krzysztofolipra.com;

    location / {
        proxy_pass http://127.0.0.1:3002;
        include /etc/nginx/proxy_params;
    }
}

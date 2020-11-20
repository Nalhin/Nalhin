server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

    root /var/www/krzysztofolipra.com/RealEstateTi/frontend/dist;

    index index.html index.htm index.nginx-debial.html;

    server_name realestate.krzysztofolipra.com www.realestate.krzysztofolipra.com;

    location ~ (.*)/static/(.*) {
        try_files /static/$2 /static/$2/;
    }

    location = /graphql {
        proxy_pass https://www.api-realestate.krzysztofolipra.com/graphql;
    }
    location ~ /image/(.*) {
        proxy_pass https://www.api-realestate.krzysztofolipra.com/$1;
    }

    location / {
        try_files $uri $uri/ /index.html;
    }
}

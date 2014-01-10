# docker-xpressengine

This is Dockerfile for building [xpressengine](https://github.com/rauhryan/xpressengine) application image.

## Building Dockerfile

1. Clone this repository.

```sh
$ git clone docker-xpressengine
$ cd docker-xpressengine
```

1. Build Dockerfile.

```sh
$ docker build -t nacyot/xpressengine .
```

## Starting Server

```
$ docker run -d -p <PUBLIC_PORT>:80 nacyot/xpressengine
```

Replace `<PUBLIC_PORT>` with the number. You can access your XpressEngine
application on `http://127.0.0.1:<PUBLIC_PORT>/xe`

# Installing XpressEngine

`http://127.0.0.1:<PUBLIC_PORT>/xe`

## Setup Mysql

```
ID : xpressengine
Password : xpressengine
Database : xpressengine
```

## Setting up Nginx Proxy

```nginx
upstream xpressengine_server {
  server 127.0.0.1:<PUBILC_PORT>;
}

server {
  server_name <YOUR_DOMAIN>;

  location / {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://xpressengine_server;
  }
}
```


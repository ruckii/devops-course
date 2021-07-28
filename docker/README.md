# Docker practice task

## 1. Dokerfiles
 * App1 (**busybox httpd** with static index.html) - port 8081 
 * App2 (**nginx** with static index.html and custom nginx.conf, default.conf) - port 8080 

## 2. Building double-tagged images and pushing to local registry
### 2.1 Run local registry
    docker run -d -p 5000:5000 --restart always --name registry registry:2
### 2.2 Build double-tagged images
    cd App1
    docker build --tag localhost:5000/some-content-busyboxhttpd:latest --tag localhost:5000/some-content-busyboxhttpd:1.0 .
    cd ../App2
    docker build --tag localhost:5000/some-content-nginx:latest --tag localhost:5000/some-content-nginx:1.0 .
### 2.3 Push to local registry
    docker image push --all-tags localhost:5000/some-content-nginx
    docker image push --all-tags localhost:5000/some-content-busyboxhttpd
### 2.4 Docker run from local registry (example)
    docker pull localhost:5000/some-content-nginx:latest
    docker run -d localhost:5000/some-content-nginx

### 2.5 Images (example)
    $ docker images
    REPOSITORY                              TAG             IMAGE ID       CREATED       SIZE
    some-content-busyboxhttpd               1.0             4b72d0665059   8 hours ago   5.75MB
    some-content-busyboxhttpd               latest          4b72d0665059   8 hours ago   5.75MB
    some-content-nginx                      1.0             a2cb395f2931   9 hours ago   22.8MB
    some-content-nginx                      latest          a2cb395f2931   9 hours ago   22.8MB

## 3. Docker-compose
### 3.1 docker-compose.yaml
    version: "3.8"
    services:
        busyboxhttpd:
            image: localhost:5000/some-content-busyboxhttpd:1.0
            volumes:
            - ./shared-html-directory:/var/www/html
            ports:
            - "8081:8081"
            networks:
            - web1
            deploy:
                resources:
                limits:
                    cpus: '1'
                    memory: 10M
        nginx:
            image: localhost:5000/some-content-nginx:1.0
            volumes:
            - ./shared-html-directory:/usr/share/nginx/html
            ports:
            - "8080:8080"
            networks:
            - web2
            deploy:
                resources:
                limits:
                    cpus: '1'
                    memory: 20M
    networks:
        web1:
            driver: bridge
        web2:
            driver: bridge
### 3.2 Start docker-compose service
    docker-compose up -d


 
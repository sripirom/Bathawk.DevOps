# Taiga


first step
- create postgres database 'taiga_db'
# taiga htdvisser/taiga-fron-ist and taiga-back
data:
  image: tianon/true
  restart: always
  volumes:
    - /usr/local/taiga/media
    - /usr/local/taiga/static
    - /usr/local/taiga/logs
    #- /var/lib/postgresql/data
#db:
  #image: postgres
 # container_name: db
  #environment:
   # POSTGRES_USER: taiga
   # POSTGRES_PASSWORD: Tonhoam54
  #volumes_from:
   # - data
taigaback:
  image: htdvisser/taiga-back:stable
  restart: always
  container_name: taiga-back
  hostname: taiga-back
  environment:
    HOSTNAME: sripirom.thddns.net:1446
    SECRET_KEY: 4reowTQJJGKoGLFGiDbL44ISAazTAZyN
    EMAIL_USE_TLS: 1
    EMAIL_HOST: smtp.gmail.com
    EMAIL_PORT: 587
    EMAIL_HOST_USER: tikclicker@gmail.com
    EMAIL_HOST_PASSWORD: Tik@2554
    POSTGRES_DB_NAME: taiga_db
    POSTGRES_USER: taiga
    POSTGRES_PASSWORD: Tonhoam54
    POSTGRES_HOST: 192.168.1.10
    POSTGRES_PORT: 5432
  volumes_from:
    - data
taigafront:
  image: htdvisser/taiga-front-dist:stable
  restart: always
  container_name: taiga-front
  hostname: taiga-front
  links:
    - taigaback
  volumes_from:
    - data
  ports:
    - 0.0.0.0:80:80
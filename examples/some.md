#

## Image

### list all images

```bash
docker images
```

programmming is wrongg

### remove one or more images (must not have any container before deleting)

```bash
docker rmi some_image
```

[Contexts: "[jump](#list-all-containers-file-sizes)"]

---

### create image from container

```bash
docker commit some_container some_image
```

- Programming languages
  1. [ ] python
  2. [ ] C++
  3. [x] javascript

Some of these words _are emphasized_.

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.

````python

```python
import os
import sys

if __name__ == "__main__":
    print("Hello World")
````

````

## Container

### List

#### list all running containers

docker ps

#### list all containers

```bash
docker ps -a
````

#### list all containers & file sizes

```bash
docker ps -a -s
```

### Delete

#### remove one or more containers

```bash
docker rm some_container
```

### Run

#### 啟動一個 bash 終端，允許使用者進行互動

```bash
docker run -it ubuntu:14.04 /bin/bash
```

#### 啟動一個 bash 終端，允許使用者進行互動, 且命名為 dochi

```bash
docker run -it --name dochi ubuntu:22.04 /bin/bash
```

#### 啟動一個 bash 終端，允許使用者進行互動，退出時關閉容器

```bash
docker run -it --rm ubuntu:14.04 /bin/bash
```

#### run container with docker volume

```bash
docker run --rm -it -v my_volume:/workdir some_container --workdir=/workdir
docker run --rm -it -v /path/at/host:/workdir some_container
```

#### Image的Dockerfile若有CMD指令，啟動container後，若想進bash，需下指令

```bash
docker exec -it some_container bash
```

#### stop container

```bash
docker stop some_container
```

#### delete container

```bash
docker rm some_container
```

### copy

#### 在host跟容器間複製檔案

```bash
@code bash
docker cp foo.txt mycontainer:/foo.txt
docker cp mycontainer:/foo.txt foo.txt
```

### Inspect Show docker disk usage

```bash
docker system df
```

#### Show docker disk usage with more detailed view

```bash
docker system df -v
```

### rename

```bash
docker container rename old new
```

### docker hub

#### Push to Docker Hub

```bash
docker login
docker tag u20zsh zealzel/u20zsh:test
docker push zealzel/u20zsh:test
```

### tricks

#### always start the container after the computer is restarted

```bash
# update
docker update --restart=always container_name

# confirm th restart policy
docker inspect -f '{{.HostConfig.RestartPolicy.Name}}' dev
```

## docker-compose

### Build

#### Only rebuild one service without cache when using docker-compose-1.yml up

```bash
docker-compose -f docker-compose-1.yml build --no-cache ros-build-machine
docker-compose -f docker-compose-1.yml build --no-cache ros-raspi-1
```

#### Only rebuild one service without cache when using docker-compos-2.ymle up

```bash
docker-compose -f docker-compose-2.yml build --no-cache ros-build-machine-lvim
docker-compose -f docker-compose-2.yml build --no-cache ros-raspi-2
```

#### up

```bash
docker-compose -f docker-compose-2.yml up -d
```

<!-- toc -->

- [Image](#image)
  - [list all images](#list-all-images)
  - [remove one or more images (must not have any container before deleting)](#remove-one-or-more-images-must-not-have-any-container-before-deleting)
  - [create image from container](#create-image-from-container)
- [Container](#container)
  - [List](#list)
    - [list all running containers](#list-all-running-containers)
    - [list all containers](#list-all-containers)
    - [list all containers & file sizes](#list-all-containers--file-sizes)
  - [Delete](#delete)
  - [remove one or more containers](#remove-one-or-more-containers)
  - [Run](#run)
    - [啟動一個 bash 終端，允許使用者進行互動](#%E5%95%9F%E5%8B%95%E4%B8%80%E5%80%8B-bash-%E7%B5%82%E7%AB%AF%E5%85%81%E8%A8%B1%E4%BD%BF%E7%94%A8%E8%80%85%E9%80%B2%E8%A1%8C%E4%BA%92%E5%8B%95)
    - [啟動一個 bash 終端，允許使用者進行互動, 且命名為 dochi](#%E5%95%9F%E5%8B%95%E4%B8%80%E5%80%8B-bash-%E7%B5%82%E7%AB%AF%E5%85%81%E8%A8%B1%E4%BD%BF%E7%94%A8%E8%80%85%E9%80%B2%E8%A1%8C%E4%BA%92%E5%8B%95-%E4%B8%94%E5%91%BD%E5%90%8D%E7%82%BA-dochi)
    - [啟動一個 bash 終端，允許使用者進行互動，退出時關閉容器](#%E5%95%9F%E5%8B%95%E4%B8%80%E5%80%8B-bash-%E7%B5%82%E7%AB%AF%E5%85%81%E8%A8%B1%E4%BD%BF%E7%94%A8%E8%80%85%E9%80%B2%E8%A1%8C%E4%BA%92%E5%8B%95%E9%80%80%E5%87%BA%E6%99%82%E9%97%9C%E9%96%89%E5%AE%B9%E5%99%A8)
    - [run container with docker volume](#run-container-with-docker-volume)
    - [Image的Dockerfile若有CMD指令，啟動container後，若想進bash，需下指令](#image%E7%9A%84dockerfile%E8%8B%A5%E6%9C%89cmd%E6%8C%87%E4%BB%A4%E5%95%9F%E5%8B%95container%E5%BE%8C%E8%8B%A5%E6%83%B3%E9%80%B2bash%E9%9C%80%E4%B8%8B%E6%8C%87%E4%BB%A4)
    - [stop container](#stop-container)
    - [delete container](#delete-container)
  - [copy](#copy)
    - [在host跟容器間複製檔案](#%E5%9C%A8host%E8%B7%9F%E5%AE%B9%E5%99%A8%E9%96%93%E8%A4%87%E8%A3%BD%E6%AA%94%E6%A1%88)
  - [Inspect Show docker disk usage](#inspect-show-docker-disk-usage)
    - [Show docker disk usage with more detailed view](#show-docker-disk-usage-with-more-detailed-view)
  - [rename](#rename)
  - [docker hub](#docker-hub)
    - [Push to Docker Hub](#push-to-docker-hub)
  - [tricks](#tricks)
    - [always start the container after the computer is restarted](#always-start-the-container-after-the-computer-is-restarted)
- [docker-compose](#docker-compose)
  - [Build](#build)
    - [Only rebuild one service without cache when using docker-compose-1.yml up](#only-rebuild-one-service-without-cache-when-using-docker-compose-1yml-up)
    - [Only rebuild one service without cache when using docker-compos-2.ymle up](#only-rebuild-one-service-without-cache-when-using-docker-compos-2ymle-up)
    - [up](#up)

<!-- tocstop -->

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
  3. [x] javascript color: #000000|#ff0000|#00ff00|#0000ff|#ffffff

Some of these words _are emphasized_.

> This is a block-quote with two paragraphs. sit ament,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.

````python

```python
import os
import sys

if __name__ == "__main__":
    print("Hello World")
````

## Container

### List

#### list all running containers

docker ps

#### list all containers

```bash
docker ps -a
```

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

## Docker-compose

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

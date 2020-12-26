


# 删除
```shell
# docker rmi : 删除本地一个或多少镜像，-f :强制删除

# 删除所有容器
docker rm `docker ps -a -q`

# 删除所有镜像
docker rmi `docker images -q`

# 删除所有没有tag的镜像
docker rmi `docker images|grep none|awk '{print $3 }'|xargs`

# 删除指定的镜像
docker rmi -f `docker images | grep "ccr.ccs.tencentyun.com/face_cloud/"| awk '{print $3}'`
docker rmi -f `docker images | grep "dockerhub.deepglint.com/arch/spectre"| awk '{print $3}'`

```
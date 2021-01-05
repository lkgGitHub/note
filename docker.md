

```shell
docker start $(docker ps -aq)

# 停止所有 docker 容器
docker stop $(docker ps -aq)

# 删除所有 docker 容器
docker rm $(docker ps -aq)

# 删除所有 docker 镜像
docker rmi $(docker images -q)

# 资源清理
docker container prune  # 删除所有退出状态的容器
docker volume prune     # 删除未被使用的数据卷
docker image prune      # 删除 dangling 或所有未被使用的镜像

docker system prune     #删除已停止的容器、dangling 镜像、未被容器引用的 network 和构建过程中的 cache
# 安全起见，这个命令默认不会删除那些未被任何容器引用的数据卷，如果需要同时删除这些数据卷，你需要显式的指定 --volumns 参数
# #这次不仅会删除数据卷，而且连确认的过程都没有了！注意，使用 --all 参数后会删除所有未被引用的镜像而不仅仅是 dangling 镜像
docker system prune --all --force --volumns 
```

# 删除
```shell
docker volume rm $(docker volume ls -qf dangling=true)
docker volume ls -qf dangling=true

// 查看所有容器卷
docker volume ls

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
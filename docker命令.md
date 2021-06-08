# docker 命令
## 容器生命周期管理
run
start/stop/restart
kill
rm
pause/unpause
create
exec
## 容器操作
ps
inspect
top
attach
events
logs
wait
export
port
## 本地镜像管理
images
rmi
tag
build
history
save
load
import
## 容器rootfs命令
commit
cp
diff
## 镜像仓库
login
pull
push
search
## info|version
info
version

### docker ps
> docker ps -a
-a : 显示所有的容器，包括未运行的
-f :根据条件过滤显示的内容。
--format :指定返回值的模板文件。
-l :显示最近创建的容器。
-n :列出最近创建的n个容器。
--no-trunc :不截断输出。
-q :静默模式，只显示容器编号。
-s :显示总的文件大小。
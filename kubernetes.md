# docker
```shell
docker save -o xxx.tar "imageName:tag"
docker load -i "cloud-importer.tar"

```
# kubectl
```shell
# 查看命名空间
kubectl get namespace

kubectl get cm -n monitoring
# pod
kubectl get pod -n "namespace"
kubectl get deployment -n "namespace"
kubectl delete pods -n "namespace" --all
## 列出所有pods，并筛选出“name”
kubectl get pods --all-namespaces|grep "name"

# 查看服务service
kubectl get svc


# 连接远程集群
# 配置集群名称与服务地址
kubectl config --kubeconfig=${HOME}/.kube/config set-cluster cluster-name --server=https://192.168.5.76:6443 --insecure-skip-tls-verify

# 设置一个管理用户为admin，并设置访问凭证。此处使用 用户名-密码 的验证方式
kubectl config --kubeconfig=${HOME}/.kube/config set-credentials admin --username=username --password=pwd

# 设置一个名为 admin 的配置，使用 cluster-name 集群与 admin 用户的上下文
kubectl config --kubeconfig=${HOME}/.kube/config set-context kubernetes-admin@kubernetes --cluster=kubernetes

# 启用 admin 为默认上下文
kubectl config --kubeconfig=${HOME}/.kube/config use-context admin

```

# 日志 kubectl logs
> kubectl logs [-f] [-p] POD [-c CONTAINER]
-c, --container="": 容器名。
-f, --follow[=false]: 指定是否持续输出日志。
    --interactive[=true]: 如果为true，当需要时提示用户进行输入。默认为true。
    --limit-bytes=0: 输出日志的最大字节数。默认无限制。
-p, --previous[=false]: 如果为true，输出pod中曾经运行过，但目前已终止的容器的日志。
    --since=0: 仅返回相对时间范围，如5s、2m或3h，之内的日志。默认返回所有日志。只能同时使用since和since-time中的一种。
    --since-time="": 仅返回指定时间（RFC3339格式）之后的日志。默认返回所有日志。只能同时使用since和since-time中的一种。
    --tail=-1: 要显示的最新的日志条数。默认为-1，显示所有的日志。
    --timestamps[=false]: 在日志中包含时间戳。
```shell
# 日志 
kubectl logs -f "podName" -n "namespace"

# 返回仅包含一个容器的pod nginx的日志快照
$ kubectl logs nginx

# 返回pod ruby中已经停止的容器web-1的日志快照
$ kubectl logs -p -c ruby web-1

# 持续输出pod ruby中的容器web-1的日志
$ kubectl logs -f -c ruby web-1

# 仅输出pod nginx中最近的20条日志
$ kubectl logs --tail=20 nginx

# 输出pod nginx中最近一小时内产生的所有日志
$ kubectl logs --since=1h nginx
```

# 滚动升级
```shell
# 1. 直接修改yaml文件，使用apply命令更新
vim nginx-deploy.yaml
kubectl apply -f nginx-deploy.yaml

# 2. 直接编辑deployment内容
kubectl get deploy -n deepcloud
kubectl edit deploy nginx-test

# 3. 使用kubectl set命令
kubectl set image deploy nginx-test nginx=nginx:1.11
```
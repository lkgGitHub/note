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

# 日志
kubectl logs -f "podName" -n "namespace"


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
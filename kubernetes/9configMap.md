# 1. ConfigMap
作用：存数据到etcd，让pod以变量或者Volume挂载到容器中

# 
kubectl create configmap <name> --from-file=<local_name>
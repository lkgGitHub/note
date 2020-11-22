# 1. what is controller
作用：管理和运行容器的对象

# 2. Pod and Controller 关系
controller 控制运维 pod

通过label标签建立联系
selector

# 3. Deployment 控制器应用场景
无状态服务
管理Pod和ReplicaSet
部署、滚动升级等功能。
适合场景：web服务、无状态的服务

# 4. yaml文字字段说明

## 部署发布应用
```shell
kubectl create deployment web --image=nginx  --dry-run -o yam > web.yaml 
kubectl applay -f web.yaml
kubectl expose deployment <web> --port=80 --type=NodePort --target-port=80 --name=<web1> -o webPort.yaml
```
# 5. 升级回滚
```shell
kubectl set image deployment <deployName> nginx=nginx:1.15
# 查看升级状态
kubectl rollout status deployment <deployName> 
# 查看升级历史
kubectl rollout history deployment <deployName> 
# 回滚到上一个版本,undo
kubectl rollout undo deployment <deployName> 

```
# 6. 弹性伸缩

```shell
kubectl scale deployment <deployName> --replicas=10
```

# 概念
## pod
pod是一个环境(包括容器、存储、网络ip:port、容器配置)。pod是临时性的，用完即丢弃的，当pod中的进程结束、node故障，或者资源短缺时，pod会被干掉。
## service
配置将创建出来一个新的Service对象，名为my-service，后端是所有包含app=MyApp的pod，目标端口是9376，同时这个service也会被分配一个ip，被称为集群ip，对应的端口是80. 如果不指定targetPort, 那么targetPort与port相同。关于targetPort更灵活的设定是，targetPort可以是一个String类型的名字，该名字对应的真实端口值由各个后端pod自己定义，这样同一组pod无需保证同一个port，更加灵活。


deployment根据Pod的标签关联到Pod,是为了管理pod的生命周期
service根据Pod的标签关联到pod,是为了让外部访问到pod,给pod做负载均衡
```yaml
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
```

## 创建pod
```yaml
apiVersion: apps/v1 #apiVersion是当前配置格式的版本
kind: Deployment #kind是要创建的资源类型
metadata:  #metadata是该资源的元数据，name是必须的元数据项
  #指定deployment的名称
  name: demo-deployment
  labels:
    app: ecs-demo  #标签
spec:
  #期望创建3个实例（3个pod）
  replicas: 3
  selector: # .spec.selector 必须匹配 .spec.template.metadata.labels，否则它将被API拒绝。如果 .spec.selector 没有被指定， .spec.selector.matchLabels 默认是 .spec.template.metadata.labels
    #选择label：app=ecs-demo的pod来创建实例
    matchLabels:   #metadata定义Pod的元数据，至少要顶一个label，label的key和value可以任意指定
      app: ecs-demo
  template:
    metadata:
      labels:
        app: ecs-demo
    spec:
      containers:
      - name: ecs-demo
        image: wangzhh/login_demo:20200429   # docker imange地址  REPOSITORY:TAG
        ports:
        - containerPort: 8080 #暴露给service的地址
        readinessProbe: #就绪探针
          httpGet:
            port: 8080
            path: /
          initialDelaySeconds: 50 # initialDelaySeconds这个参数 机器新能不好调大
          periodSeconds: 10
        livenessProbe:
          httpGet:
            path: /
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 50 # initialDelaySeconds这个参数 机器新能不好调大
          periodSeconds: 10
```

## 创建service
```yaml
apiVersion: v1 #apiVersion是当前配置格式的版本
kind: Service #kind是要创建的资源类型
metadata: #metadata是该资源的元数据，name是必须的元数据项
  name: demo-service
spec:
  selector: # selector 指明挑选那些 label 为 run: xx 的 Pod 作为 Service 的后端。
    app: ecs-demo
  ports:  #将Service 的 8080 端口映射到 Pod 的 8080 端口，使用 TCP 协议
  - protocol: TCP
    port: 8080
    targetPort: 8080
    nodePort: 30036  # nodePort，它指定节点上开放的端口值 端口范围只能是 30000-32767，如果不指定这个端口，系统将选择一个随机端口
  sessionAffinity: ClientIP # service内部实现session保持
  sessionAffinityConfig:
    clientIP:
        timeoutSeconds: 10800 # timeoutSeconds指的是session保持的时间，这个时间默认是10800秒，也就是三个小时
  type: NodePort # 暴露service的三种方式 NodePort，LoadBalancer 和 Ingress 
```

# 字段说明
apiVersion - 创建该对象所使用的 Kubernetes API 的版本
kind - 想要创建的对象的类别
metadata - 帮助唯一性标识对象的一些数据，包括一个 name 字符串、UID 和可选的 namespace

对象 spec（规约） 和 对象 status（状态） 
- replicas – 告知 Kubernetes 在部署期间要创建的 Pod 的数量。通过修改此字段，可以轻松扩展容器化应用程序。
- spec.strategy.type – 假设需要部署该应用程序的另一个版本，并且在部署阶段，您需要在不造成中断的情况下进行更新。滚动更新策略允许 Kubernetes 通过一次更新一个 Pod 来更新服务，而不会造成中断。
- spec.strategy.rollingUpdate.maxUnavailable – 滚动更新期间可能不可用的 Pod 的最大数量。
- spec.strategy.rollingUpdate.maxSurge – 在超过所需 Pod 数量时可以调度的 Pod 的最大数量。
- spec.minReadySeconds – 可选，是一个描述最短时间（以秒为单位）的整数，在此时间内，新 Pod 应处于就绪状态，其任何容器都不能崩溃才能将其视为可用。
- spec.revisionHistoryLimit – 可选，是一个整数属性，用来明确告知 Kuberneres 在任何给定时间应保留多少个旧的副本集。
- spec.template.metadata.labels – 向部署规范中添加标签。
- spec.selector – 可选对象，用来告知 Kubernetes 部署控制器只能将匹配指定标签的 Pod 作为目标。因此，要将包含标签“app”和“deployer”的 Pod 作为目标，可以对我们的部署 yaml 进行以下修改。
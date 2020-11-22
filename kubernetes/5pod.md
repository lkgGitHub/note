# pod实现机制
1. 共享网络
2. 共享存储

# imagePullPolicy: pod 镜像拉取策略
1. IfNotPresent： 默认
2. Always
3. Never

# resources     pod 资源配置
1. requests 调度
2. limits 限制

# restartPolicy: pod 重启机制
1. Always   容易退出，就重启（默认）
2. OnFailure    异常退出，才重启
3. Never 容器退出，从不重启

# pod 健康检查，
1. livenessProbe  存活检查
2. readinessProbe  就绪检查

检查方式：
1. http请求
2. exec shell命令
3. tcpSocket

# pod调度

1. 资源限制 resources
2. 节点选择器 nodeSelector
创建节点标签
kubectl label node <node_name> env_role=<dev>
3. 节点亲和性 nodeAffinity
硬亲和性，必须满足
key operator value
软亲和性，尽量满足
weight（权重）key operator value
operator：In, NotIn, Exists, Gt, Lt, DoesNotExists
4. 污点和污点容忍
Taint 污点，节点不做普通的
场景：专用节点、特定硬件配置、寄语Taint驱逐

NotSchedule     一定不被调度
PreferNoSchedule    尽量不调度
NoExecute   不会调度，并且会驱逐Node已有Pod

添加污点
kubectl taint node [node] env_role=
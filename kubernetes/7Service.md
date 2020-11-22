# 1. Service 作用
1. 防止Pod失联（服务发现）
2. 定义一组Pod的访问策略（负载均衡）

# 2. Pod 和 Service 关系
label 和 selector 建立关联
vip 对外暴露的虚拟ip

# 3. Service 类型
kubectl expose --help
--type='': Type for this service: ClusterIP, NodePort, LoadBalancer, or
ExternalName. Default is 'ClusterIP'.

1. ClusterIP    内部使用
2. NodePort     对外访问
3. LoadBalancer 对外访问，公有云，负载均衡、控制器。
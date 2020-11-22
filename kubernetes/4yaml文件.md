# 1. 语法格式
通过缩进表示层级关系
禁止使用tab，只能使用空格
字符后缩进一个空格，比如冒号、逗号
使用--表示新的yaml文件开始
使用#代表注释

# 2. yaml文件组成部分
控制器定义

tmplate：被控制的对象


|||
|----------|-------|
| kind     | 资源类型  |
| metadata | 资源元数据 |
| spec     | 资源规格  |
| replicas | 副本数量  |
| selector | 标签选择器 |
| template | Pod模版  |
| container | 容器配置 |
# 3. 快速生产yaml文件
方式一：kubectl create
kubectl create deployment web --image=nginx -o yaml --dry-run > nginx.yaml

方式二： kubectl get po 
kubectl get deploy nginx -o=yaml --export > nginx.yaml
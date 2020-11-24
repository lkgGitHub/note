
# what
包管理工具，让部署应用更加方便。类比：yum/apt

# why 解决了什么问题
1. 原来有大量编写yaml文件，
2. 各个yaml的版本管理难


1. heml可以把项目的yaml作为一个整体管理
2. yaml高效复用
3. helm应用级别的版本管理

# Helm 概念
1. Heml     命令行工具，用于chart的创建、打包、发布、管理
2. Chart    应用描述，yaml集合
3. Release  基于chart的部署实体，一个chart被Heml运行后，生成一个release

# Helm 命令
```shell 
# repo 
helm repo add stable http://mirror.azure.cn/kubernetes/charts/
helm repo list
helm repo update

# 安装软件
helm search repo 
helm install 
helm list

# 创建chart
helm create chartName

```
Chart.yaml  当前chart属性配置信息
templates   编写yaml
values.yaml 全局变量

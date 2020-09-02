参考文档https://www.prometheus.wang/

## Prometheus 日常命令
```shell
./prometheus --config.file=prometheus.yml
# http://localhost:9090/


# install grafana, path: /usr/local/Cellar/grafana/7.1.5
# http://127.0.0.1:3000/
brew install grafana
brew services start grafana
brew services stop grafana

```

# 初识PromQL

# PromQL聚合操作
sum (求和)
min (最小值)
max (最大值)
avg (平均值)
stddev (标准差)
stdvar (标准差异)
count (计数)
count_values (对value进行计数)
bottomk (后n条时序)
topk (前n条时序)
quantile (分布统计)

# 内置函数
## 计算Counter指标增长率
increase(v range-vector)：获取区间向量中的第一个后最后一个样本并返回其增长量
rate(v range-vector)：可以直接计算区间向量v在时间窗口内平均增长速率
## 预测Gauge指标变化趋势
predict_linear(v range-vector, t scalar) :可以预测时间序列v在t秒后的值。它基于简单线性回归的方式。
## 统计Histogram指标的分位数
histogram_quantile(φ float, b instant-vector)：其中φ（0<φ<1）表示需要计算的分位数，如果需要计算中位数φ取值为0.5
## up指标可以获取到当前所有运行的Exporter实例以及其状态
up指标可以获取到当前所有运行的Exporter实例以及其状态

# Metric类型
Prometheus定义了4中不同的指标类型(metric type)：
1. Counter（计数器）:只增不减的计数器
2. Gauge（仪表盘）:可增可减的仪表盘，侧重于反应系统的当前状态
3. Histogram（直方图）：直接在客户端计算了数据分布的分位数情况
4. Summary（摘要）

# Prometheus组件
1. Prometheus Server
2. Exporters
3. AlertManager
4. PushGateway

# 最佳实践
|级别|	监控什么|	Exporter|
|-|-|-|
网络|	网络协议：http、dns、tcp、icmp；网络硬件：路由器，交换机等|	BlockBox Exporter;SNMP Exporter|
主机|	资源用量|	node exporter|
容器|	资源用量|	cAdvisor|
应用(包括Library)|	延迟，错误，QPS，内部状态等|	代码中集成Prmometheus Client|
中间件状态|	资源用量，以及服务状态|	代码中集成Prmometheus Client|
编排工具|	集群资源用量，调度等|	Kubernetes Components|
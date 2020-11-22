# 1. 有状态应用
Pod是不一样的
顺序
在哪个node运行
不能随意伸缩和扩展

让每个pod独立，保持pod启动顺序和唯一性
唯一的网络标识符，持久存储
有序，eg：mysql主从

# 2. 部署有状态应用
ClusterIp：none
kind： StatefulSet

# 3. 部署守护进程DaemonSet
kind: DaemonSet

# 4. 部署job（一次性任务）
kind: Job

最后状态（status）：Completed
通过日志查看过程
# 5. 部署cronjob（定时任务）

```yaml
kind: CronJob
spec:
  schedule: "*/1 * * * *"
```


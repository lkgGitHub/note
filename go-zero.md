
视频<https://www.bilibili.com/video/BV1Jy4y127Xu>
https://studygolang.com/articles/33240?fr=sidebar
# 1. 微服务系统如何拆分？
1. 先粗后细，切记过细
2. 横向拆分，而非纵向。纵向分层最好不超过三层
3. 单向调用，禁止循环调用
4. 禁止接口类型透传。在不同的层之间不要共享同一个数据定义，避免一处修改，影响其它
5. 没有依赖关系的串行调用改为并行调用。可以通过 core/mr 包降低响应延迟而不增加系统负载

# 2. 如何保障高并发高可用？
1. 良好的数据边界
   <br> 不同的服务之间不要显示共享数据，而应该通过 rpc 共享
2. 高效的缓存管理
3. 优雅的熔断降载保护
   <br> 熔断和降载是防止服务雪崩的最有效手段之一
4. 弹性伸缩能力
   <br> 对于高并发的系统来说，突发流量洪峰的情况下，系统需要能够及时水平扩容
5. 清晰的资源使用定义
   <br> 对资源使用做清晰的定义，比如我们到底在什么时候考虑扩充资源。70%
6. 高效的监控报警
   <br> 没有度量就没有优化。我们必须对系统有高效的监控和及时的报警机制

# 大型微服务项目从何下手？
load Balancer ==> service ==> cache ==> database
1. 从单体服务开始
2. 业务优先，技术支撑
3. 服务指标监控
4. 数据拆分+缓存管理
5. 服务拆分
6. 支撑系统建设
7. 自动化+工程建设

# 3. go-zero 如何自动管理缓存
只删除，不做更新
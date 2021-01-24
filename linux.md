
# 常用命令
```shell
# grep 
grep -C 5 foo file # 显示file文件里匹配foo字串那行以及上下5行
grep -B 5 foo file # 显示foo及前5行
grep -A 5 foo file # 显示foo及后5行


# telnet方式测试远程主机端口是否打开 
telnet IP port
# 检查端口是否开放
lsof -i:6379
netstat -aptn |grep -i 6379 # 查看是否监听在0.0.0.0:6379
watch "ss -a | wc -l"
netstat -ae | grep -i TIME_WAIT

# unit 日志
journalctl -u -f service.name

# 查看目录下所有文件夹
du -ah --max-depth=1
```
# 磁盘 iostat
## cpu 属性

avg-cpu:         

| %user                                       | %nice                       | %system                                  | %iowait                        | %steal                                                       | %idle             |
| ------------------------------------------- | --------------------------- | ---------------------------------------- | ------------------------------ | ------------------------------------------------------------ | ----------------- |
| 在用户态（用户空间）运行所使用的CPU的百分比 | nice操作所使用的CPU的百分比 | 在系统态(内核空间)运行所使用CPU的百分比. | 等待输入输出 所使用cpu的百分比 | 只对虚拟机有效，表示分配给当前虚拟机的 CPU 时间之中，被同一台物理机上的其他虚拟机偷走的时间百分比。 | CPU空闲时间百分比 |

> 如果%iowait的值过高，表示硬盘存在I/O瓶颈，%idle值高，表示CPU较空闲，如果%idle值高但系统响应慢时，有可能是CPU等待分配内存，此时应加大内存容量。%idle值如果持续低于10，那么系统的CPU处理能力相对较低，表明系统中最需要解决的资源是CPU。



- await:  每个IO的平均处理时间（单位是微秒毫秒）。这里可以理解为IO的响应时间，一般地系统IO响应时间应该低于5ms，如果大于10ms就比较大了。这个时间包括了队列时间和服务时间，也就是说，一般情况下，await大于svctm，它们的差值越小，则说明队列时间越短，反之差值越大，队列时间越长，说明系统出了问题。

> 

主要看的指标一个是cpu的使用率中iowait值很高，另外一个则是磁盘的使用率util，


top
iotop
htop

```

```
# 1. CPU
top

# 2. 内存


# 4. 磁盘IO
iostat -x （查看磁盘状态）
iotop命令 （查看磁盘状态）


# 3. 网络IO
1. 监控总体带宽使用――nload、bmon、slurm、bwm-ng、cbm、speedometer和netload
2. 监控总体带宽使用（批量式输出）――vnstat、ifstat、dstat和collectl
3. 每个套接字连接的带宽使用――iftop、iptraf、tcptrack、pktstat、netwatch和trafshow
4. 每个进程的带宽使用――nethogs

## nload
让用户可以分开来监控入站流量和出站流量。它还可以绘制图表以显示入站流量和出站流量。
如果你只需要快速查看总带宽使用情况，无需每个进程的详细情况，那么nload用起来很方便。

## iftop


# git
```shell
# 撤销上一次commit
git reset --soft HEAD^
```


# 使用公钥登陆，禁止密码登陆
ssh-keyge
output:Enter file in which to save the key (/root/.ssh/id_rsa):
//这句话的意思是你希望把生成的密钥对放在哪个位置，默认的是：/root/.ssh/id_rsa 默认就好，所以我们这里直接回车就好。
output:Enter passphrase (empty for no passphrase):
//这句话的意思是是否设置双重认证，就是为你的私钥添加一个密码，如果图方便，直接回车就好，如果为了更加安全，设置个简单密码就好。
//如果设置了双重认证，需要再一次确认密码
output:
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
aa:8b:61:13:38:ad:b5:49:ca:51:45:b9:77:e1:97:e1 root@localhost.localdomain
The key's randomart image is:
+--[ RSA 2048]----+
|    .o.          |
|    ..   . .     |
|   .  . . o o    |
| o.  . . o E     |
|o.=   . S .      |
|.*.+   .         |
|o.*   .          |
| . + .           |
|  . o.           |
+-----------------+
//完成

```shell
ssh-keygen
# 这一步是把生成的公钥导入到ssh的配置文件中
cat id_rsa.pub >> authorized_keys 
# 以防万一，我们给予文件更高的权限
chmod 600 authorized_keys 
chmod 700 /root/.ssh

# 打开ssh配置文件
# 找到PubkeyAuthentication（在第37行）,默认的话，是被注释的，并且为no，我们把注释去掉，并且改为yes //开启密钥登陆
# 找到PasswordAuthentication（在第56行）,默认的话，是被注释的，并且为yes，我们把注释去掉，并且改为no //关闭密码登陆
vim /etc/ssh/sshd_config 

# 重启ssh服务
service sshd restart 
```


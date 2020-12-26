
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

# 查看目录下所有文件夹
du -ah --max-depth=1
```

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


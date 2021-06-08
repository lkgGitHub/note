
## 常用命令
```shell
systemctl status nginx

```


## 彻底卸载nginx
```shell
# 安装
apt install nginx

# 删除 nginx，–purge包括配置文件
apt --purge remove nginx

# 列出与nginx相关的软件 并删除显示的软件
dpkg --get-selections|grep nginx
apt --purge remove 

```
```shell
# 查端口：
lsof -i tcp:8888

```


# brew software
```shell
brew install git
brew install zsh
brew install kubernetes-cli
brew install grafana
# zsh语法高亮
brew install zsh-syntax-highlighting

# mac显卡模式，0: 强制使用核显； 1: 强制使用独显  2: 自动切换显卡 
sudo pmset -a GPUSwitch 0
pmset -g
```

# git访问慢，没图片
打开www.ipaddress.com，查询以下链接的DNS解析地址。
将查询到的ip 和网址添加到hosts中

```shell
github.com 
assets-cdn.github.com 
github.global.ssl.fastly.net

# 下载链接 raw.githubusercontent.com 的实际地址
codeload.github.com
```
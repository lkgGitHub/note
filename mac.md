# 常用命令
```shell
# 查端口：
lsof -i tcp:8888

```

# 快捷键
Command+Shift+. 可以显示隐藏文件、文件夹，再按一次，恢复隐藏；

# brew software
安装目录：/Users/lkg/Library/Logs/Homebrew/
```shell
brew install git
brew install zsh
brew install kubernetes-cli
brew install grafana
# zsh语法高亮
brew install zsh-syntax-highlighting

# go 静态代码质量检测工具，用于包的质量分析
brew install golangci/tap/golangci-lint

# 工具
brew install lrzsz
brew install wget
brew install make
# 自动化测试工具
brew install allure
```

## 安装和使用
```shell
# 国内安装
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/HomebrewUninstall.sh)"

#本地软件库列表：
brew ls
# 查找软件：（其中google替换为要查找的软件关键字）
brew search google
# 查看brew版本：
brew -v  
# 更新brew版本：
brew update
 
brew install telnet
```
# 显卡切换
```shell
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

# anaconda 卸载
```shell
# 1.删除Anaconda的配置
conda install anaconda-clean
anaconda-clean —yes
rm -rf /Users/mac/.anaconda/
# 2.删除Anaconda的文件夹
sudo find / -name Anaconda
rm -rf ~/anaconda3/
# 3.删除 ~/.bash_profile中anaconda的环境变量
# 4.删除Anaconda的可能存在隐藏的文件
rm -rf ~/.condarc ~/.conda ~/.continuum
```
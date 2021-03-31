#!/bin/sh
apt install zsh bash-completion
chmod +x install.sh
sh install.sh

# 命令行命令键入时的历史命令建议插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 命令行语法高亮插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# kubectl
# source <(kubectl completion zsh)
## kubectl 命令设置了别名（alias），你可以扩展 Shell 补齐，使之能够与别名一起使用
echo 'alias k=kubectl' >>/root/.zshrc
echo 'complete -F __start_kubectl k' >>/root/.zshrc

# plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting)
sed -i 's|plugins=(git)|plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting)|' /root/.zshrc
sed -i 's|➜ |\%m|g' /root/.oh-my-zsh/themes/robbyrussell.zsh-theme

source /root/.zshrc
# uninstall_oh_my_zsh
# rm -rf .oh-my-zsh/
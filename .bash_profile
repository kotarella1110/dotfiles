# ログイン時にのみ実行
# 環境変数を設定する (export する変数)

# coreutils
eval "$(gdircolors ~/.dircolors)"
# nvm
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# android
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
# ansible
#export PATH="/usr/local/opt/ansible@1.9/bin:$PATH"
# php
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# ~/.bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

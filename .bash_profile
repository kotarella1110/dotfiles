# ログイン時にのみ実行
# 環境変数を設定する (export する変数)

# coreutils
eval "$(gdircolors ~/.dircolors)"
# nvm
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# java
export JAVA_HOME=$(/usr/libexec/java_home)
# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# ~/.bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

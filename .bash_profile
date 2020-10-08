# ログイン時にのみ実行
# 環境変数を設定する (export する変数)

# coreutils
eval "$(gdircolors ~/.dircolors)"
export LANG=ja_JP.UTF-8
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# android
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$PATH"
# appium
export PATH="$JAVA_HOME/bin:$PATH"
# ansible
#export PATH="/usr/local/opt/ansible@1.9/bin:$PATH"
# php
#export PATH="/usr/local/opt/php@7.1/bin:$PATH"
#export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export PATH="/usr/local/opt/php@5.6/bin:$PATH"
export PATH="/usr/local/opt/php@5.6/sbin:$PATH"
# ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# xcode
#export DEVELOPER_DIR="/Applications/Xcode 10.1.app"
export DEVELOPER_DIR="/Applications/Xcode.app"
# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# ~/.bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

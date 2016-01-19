# ログイン時にのみ実行
# 環境変数を設定する (export する変数)

# MacPorts Installer addition on 2015-07-23_at_21:07:53: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# lsの結果の色
# export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=exexcxdxbxegedabagacad

# ~/.bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

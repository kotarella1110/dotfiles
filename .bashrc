# .bashrc は対話モードの bash を起動する時に毎回実行
# 環境変数でない変数を設定する (export しない変数)
# エイリアスを定義する
# シェル関数を定義する
# コマンドライン補完の設定をする

# docker
#PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '

# starship
eval "$(starship init bash)"

#alias ls="ls -G"
alias ls='gls -p --color=auto'


# tmux
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1
        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ _____ _____ __ __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|     |  |  |  |  |${reset_color}"
            echo "${fg_bold[red]}  | | | | | |  |  |-   -|${reset_color}"
            echo "${fg_bold[red]}  |_| |_|_|_|_____|__|__|${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l bash"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

# Gitブランチ名を表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#source ~/.git-prompt.sh
# プロンプトで表示する内容
#PS1='\[\e[0;34m\]\w\[\e[0;36m\]$(__git_ps1) \[\e[37m\]\$ '

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/kosugawara/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/kosugawara/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/kosugawara/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/kosugawara/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/kosugawara/Development/js/mell-fam/node_modules/tabtab/.completions/slss.bash ] && . /Users/kosugawara/Development/js/mell-fam/node_modules/tabtab/.completions/slss.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

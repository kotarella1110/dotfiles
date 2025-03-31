eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit

	source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

	export NVM_DIR="$HOME/.nvm"
  	[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  	[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  export JAVA_HOME=$(/usr/libexec/java_home -v 17)
  export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

export PATH=$PATH:$HOME/bin

# alias vim as nvim
alias vim=nvim
alias vimdiff='nvim -d'
export EDITOR=vim

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load direnv
eval "$(direnv hook bash)"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python3 local bin
export PATH=$PATH:$HOME/.local/bin

# git helper
alias gl="git log -n 20 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
function gr {
	current_br=$(git status -b | grep "On branch " | cut -d' ' -f3)
	if [[ "$current_br" == "master" || "$current_br" == "main" ]]; then
		git fetch --prune
		git pull origin $current_br
		branch_num=$(git branch --merged| egrep -v "(^\*|master|main|dev|develop|stg|prd|staging)" | wc -l)
		if [[ "$branch_num" != "0" ]]; then
			git branch --merged| egrep -v "(^\*|master|main|dev|develop|stg|prd|staging)" | xargs git branch -d
		fi
	else
		git fetch --prune
		git pull origin $current_br
	fi
}
alias gcommit='git diff --staged | pipegpt commit_messages | git commit -e -F -'

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fzf
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/bash-completion/bash_completion

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

## auto completion ##

# kubectl auto completion
source <(kubectl completion bash)

# helm auto completion
source <(helm completion bash)

# linkerd2 auto completion
export PATH=$PATH:$HOME/.linkerd2/bin
source <(linkerd completion bash)

# argocd auto completion
source <(argocd completion bash)

# awscli auto completion
complete -C "/usr/local/bin/aws_completer" aws

# terraform auto completion
complete -C /home/filepang/.tfenv/bin/terraform terraform

# set terminal language
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# kind auto completion
source <(kind completion bash)

# pip auto completion
source <(pip completion --bash)

# loto auto completion
source <(loto completion bash)

# yq auto completion
source <(yq shell-completion bash)

# Google Cloud SDK
if [ -f '/home/filepang/bin/google-cloud-sdk/path.bash.inc' ]; then . '/home/filepang/bin/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/home/filepang/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/home/filepang/bin/google-cloud-sdk/completion.bash.inc'; fi

# opensearch cli
source <(opensearch-cli completion bash)

# pipegpt auto completion
source <(pipegpt completion bash)

function shell {
	input=$1

	cmd=$(echo "$input" | pipegpt shell)
	if [ $? -ne 0 ]; then
		echo "$cmd"
		return
	fi

	cmd=$(echo "$cmd" | jq -r '.command')
	if [ $? -ne 0 ]; then
		echo "$cmd"
		return
	fi

	printf "Run '%s' ? [Y/n] " "$cmd"
	read -r yn

  if [ "$yn" == "y" ] || [ "$yn" == "Y" ] || ["$yn" == ""]; then
    echo "$cmd" | bash --
  fi
}

# gh auto completion
eval "$(gh completion -s bash)"

# make helper
function make {
	cwd=$(pwd)

	# if Makefile exists, run make
	if [ -f "$cwd/Makefile" ]; then
		/usr/bin/make "$@"
		return
	fi

	# if Makefile not exists,
	# find Makefile in parent directory recursively until reach home directory
	while [ "$cwd" != "$HOME" ]; do
		cwd=$(dirname "$cwd")
		if [ -f "$cwd/Makefile" ]; then
			(cd "$cwd" && /usr/bin/make "$@")
			return
		fi
	done
}

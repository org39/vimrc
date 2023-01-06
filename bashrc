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

# git
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

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# kubectl auto completion
source <(kubectl completion bash)

# helm auto completion
source <(helm completion bash)

# linkerd2 auto completion
export PATH=$PATH:$HOME/.linkerd2/bin
source <(linkerd completion bash)

# argocd auto completion
source <(argocd completion bash)

# fzf
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

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

export PATH=$PATH:$HOME/bin

# alias vim as nvim(prerelease)
alias vim=/home/filepang/tmp/nvim-linux64/bin/nvim
alias vimdiff='/home/filepang/tmp/nvim-linux64/bin/nvim -d'

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
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
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
	fi
}

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# kubectl auto completion
source <(kubectl completion bash)

# helm auto completion
source <(helm completion bash)

#  linkerd2
export PATH=$PATH:$HOME/.linkerd2/bin
source <(linkerd completion bash)

# argocd
source <(argocd completion bash)

# fzf
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# ng
NG_COMMANDS="add build config doc e2e generate help lint new run serve test update version xi18n"
complete -W "$NG_COMMANDS" ng

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

# awscli
complete -C "/usr/local/bin/aws_completer" aws

# terraform auth completion
complete -C /home/filepang/.tfenv/bin/terraform terraform

# set terminal language
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"


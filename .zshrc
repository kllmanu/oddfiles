# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	brew
	composer 
	npm nvm yarn
	httpie git
	ripgrep 
	fzf fd
	zoxide 
	pyenv
	poetry
	pass
)

test -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh && source $_
test -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && source $_

test -f $ZSH/oh-my-zsh.sh && source $_

function rat() {
	cd $(dirname "$1")
	if [[ -d $1 ]]; then
		tar -czvf $(basename "$1").tar.gz "$1"
	elif [[ -f $1 ]]; then
		tar -xzvf "$1"
	fi
	cd -
}

alias gls="gls -h --color=auto --group-directories-first -I node_modules -I vendor"
alias ll="gls -Al"
alias l="gls -l"
alias grep="grep --color -i"
alias tree="tree -I node_modules -I vendor --dirsfist"
alias tt="tree -a"
alias t="tree"
alias undo="git reset HEAD~1"
alias cat="bat"
alias yee="yee --ip=10.0.0.137"
alias arch="ssh -t M700 tmux new -As0"
alias make="gmake"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

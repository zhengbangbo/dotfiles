############################################
# ZSH Development Environment
############################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n] # confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone --depth=1 https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
plugins=(
  poetry
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# You may need to manually set your language environment
export LANG=en_US.UTF-8

############################################
# Git
############################################

alias s="git status"
alias a="git add ."
alias c="git cz"
alias p="git push"
export GPG_TTY=$TTY

############################################
# Node.js Development Environment
############################################

# pnpm
export PNPM_HOME="/Users/zbb/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
eval "$(fnm env)"

# bun completions
[ -s "/Users/zbb/.bun/_bun" ] && source "/Users/zbb/.bun/_bun"

# bun
export BUN_INSTALL="/Users/zbb/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

############################################
# Python Development Environment
############################################

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
export PATH="/Users/b/.local/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

############################################
# macOS
############################################

# https://github.com/buo/homebrew-cask-upgrade
alias up="brew update && brew cu -a -y && brew cleanup"

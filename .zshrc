# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.config/zsh"
export ZSH_CACHE_DIR=$HOME/.cache/zsh
export ADOTDIR="$HOME/.local/share/antigen"
source $ADOTDIR/antigen.zsh # Load Antigen

antigen use oh-my-zsh

antigen bundle git
# antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z

antigen theme romkatv/powerlevel10k

antigen apply

zstyle ':omz:update' mode reminder

source $ZSH/p10k.zsh
source $ZSH/aliases.zsh
source $ZSH/keybindings.zsh
source $HOME/.profile


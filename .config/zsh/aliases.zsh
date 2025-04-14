alias i="sudo pacman -S"
alias m="make"
alias n="nvim"
alias v="vim"
alias c="clear"
alias bat="batcat"
alias ls="eza"
alias la="eza --long --all --group"
alias icat="kitten icat"
alias issh="kitten ssh"
alias idiff="kitten diff"
alias kpshow="keepassxc-cli show ${KEEPASS_DEFAULT_DB} \"Test group/Aza\""

if [ -x "$(command -v batcat)" ]; then
    alias bat="batcat"
fi


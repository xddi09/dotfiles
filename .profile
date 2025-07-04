export EDITOR=nvim
export GPG_TTY=$TTY
export PYENV_ROOT="$HOME/.pyenv"

export PASSWORD_STORE_DIR=$HOME/.password-store
export PASSWORD_STORE_TOMB_FILE=$HOME/.password-tomb/pass.tomb
export PASSWORD_STORE_TOMB_KEY=$HOME/.password-tomb/pass.tomb.key

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.pyenv/bin

eval "$(pyenv init - zsh)"

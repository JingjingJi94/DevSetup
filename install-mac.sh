#!/usr/bin/env bash

# use to first time setup under mac, we need manual install python

echo "start install pyenv"
brew install pyenv
# if which pyenv init > /dev/null; then eval "$(pyenv init -)"; fi
pyenv --version
brew install pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

echo "start install make"
brew install make
echo "finish install make"

# # create evironment path on mac
ZIPPROFILE_PATH=$HOME/.zshrc
echo "start setup env for $ZIPPROFILE_PATH"

cat << 'EOF' > "$ZIPPROFILE_PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.pyenv/bin:$PATH"
source ~/.bash_profile
EOF

BASH_PROFILE_PATH=$HOME/.bash_profile
echo "start setup env for $BASH_PROFILE_PATH"

cat << 'EOF' > "$BASH_PROFILE_PATH"

# zsh couldn't recongize "~", therefore this will only work under bash terminal
export PATH="$PATH:~/Library/Python/3.12.1/bin"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:/opt/homebrew/bin"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# export PATH=$(echo $PATH | sed -e 's@:/Users/boyangtian/.pyenv/shims:@:@g')
export PATH="$HOME/.pyenv/bin:$PATH"

# alias for git
alias g="git"
alias gaa="git add -A"
alias gb="git branch"
alias gbd="git branch -D"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout main"
alias gd="git diff"
alias gfm="git fetch; git pull origin main"
alias gl="git log"
alias gm="git commit -m"
alias gp="git push"
alias gps="git push --set-upstream origin"
alias gr="git fetch && git rebase origin/main"
alias grc="git rebase --continue"
alias gs="git status"

# alias for make
alias m="make"
alias ma="make activate"
alias mc="make clean"
alias md="make deactivate"
alias mr="make run"

# alias for pyenv
alias pv="pyenv"
alias pvs="pyenv virtualenvs"

EOF

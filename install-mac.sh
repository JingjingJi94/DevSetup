#!/usr/bin/env bash

# use to first time setup under mac, we need manual install python 3.9
echo "start install bazel"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install bazel
bazel version

echo "start install go"
brew install go
go version

it need to be run after install go
TODO: not work, seems we need to install this under bazel
echo "install bazel gazelle"
go install github.com/bazelbuild/bazel-gazelle/cmd/gazelle@latest

echo "start install pyenv"
brew install pyenv
# if which pyenv init > /dev/null; then eval "$(pyenv init -)"; fi
pyenv --version
brew install pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# # create evironment path on mac
ZIPPROFILE_PATH=$HOME/.zshrc
echo "start setup env for $ZIPPROFILE_PATH"

cat << 'EOF' > "$ZIPPROFILE_PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.pyenv/bin:$PATH"
source ~/.bashrc
EOF

BASH_PROFILE_PATH=$HOME/.bashrc
echo "start setup env for $BASH_PROFILE_PATH"

cat << 'EOF' > "$BASH_PROFILE_PATH"

# zsh couldn't recongize "~", therefore this will only work under bash terminal
export PATH="$PATH:~/Library/Python/3.9/bin"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
# export PATH="$PATH:/usr/local/share/dotnet/dotnet"
# export DOTNET_ROOT="/usr/local/share/dotnet/dotnet"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# export PATH=$(echo $PATH | sed -e 's@:/Users/boyangtian/.pyenv/shims:@:@g')
export PATH="$HOME/.pyenv/bin:$PATH"

# install Docker
if ! [ -x "$(command -v docker)" ]; then
    echo "Docker is not installed. Installing Docker..."
    brew install --cask docker
    echo "Docker installation complete."
else
    echo "Docker is already installed."
fi

# setup for go
export GOPATH=$HOME/go
# setup for gazelle
export PATH=$PATH:$GOPATH/bin

# setup for gazelle
export GOBIN="$HOME/bin"
export GOPATH="$HOME/go"

# alias for docker
alias d="docker"
alias dc="docker-compose"
alias dl="docker logs --tail"
# delete the image by provide the tag
alias dd="docker rmi"
# remove all <none> docker image
alias dr="docker image prune"
# run inside the docker container, need also provide "<id> bash"
alias de="docker exec -it"

# alias for k8s
alias k="kubectl"
alias kd="kubectl describe"
alias ka="kubectl apply -f"
alias kdel="kubectl delete -f"
alias ke="kubectl exec -it"

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

# alias for bazel
alias b="bazel"
alias bb="bazel build"
alias bba="bazel build ..."
alias br="bazel run"
alias bg="bazel run //:gazelle update"

# alias for make
alias m="make"
alias ma="make activate"
alias mc="make clean"
alias md="make deactivate"
alias mr="make run"

# alias for pyenv
alias pv="pyenv"
alias pvs="pyenv virtualenvs"

# alias for project
alias p="cd $HOME/Documents/projects/"
alias u="cd $HOME/Documents/projects/unity/"
EOF

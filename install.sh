#!/usr/bin/env bash

# use to first time setup under mac, we need manual install python 3.9
echo "start install bazel"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install bazel
bazel version

echo "start install go"
brew install go
go version

# it need to be run after install go
# TODO: not work, seems we need to install this under bazel
echo "install bazel gazelle"
go install github.com/bazelbuild/bazel-gazelle/cmd/gazelle@latest

# create evironment path on mac
ZIPPROFILE_PATH=$HOME/.zprofile
echo "start setup env for $ZIPPROFILE_PATH"

cat << 'EOF' > "$ZIPPROFILE_PATH"
source ~/.bash_profile
EOF

BASH_PROFILE_PATH=$HOME/.bash_profile
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

# setup for go
export GOPATH=$HOME/go
# setup for gazelle
export PATH=$PATH:$GOPATH/bin

# setup for gazelle
export GOBIN="$HOME/bin"
export GOPATH="$HOME/go"

# alias for k8s
alias k="kubectl"
alias kd="kubectl describe"
alias ka="kubectl apply -f"
alias kdel="kubectl delete -f"
alias ke="kubectl exec -it"

# alias for git
alias g="git"
alias gfm="git fetch; git pull origin main"
alias gs="git status"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gbd="git branch -D"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gl="git log"
alias gd="git diff"
alias gr="git fetch && git rebase origin/main"
alias grc="git rebase --continue"
alias gp="git push"
alias gps="git push --set-upstream origin"

alias b="bazel"
alias bb="bazel build"
alias bba="bazel build ..."
alias br="bazel run"
alias bg="bazel run //:gazelle update"

# alias for project
alias p="cd $HOME/Documents/projects/"
alias u="cd $HOME/Documents/projects/unity/"
EOF
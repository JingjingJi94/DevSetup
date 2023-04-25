
# force read bashrc file
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

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

alias b="bazel"
alias bb="bazel build"
alias bba="bazel build ..."
alias br="bazel run"
alias bg="bazel run //:gazelle update"

# alias for project
alias p="cd $HOME/Documents/projects/"
alias u="cd $HOME/Documents/projects/unity/"

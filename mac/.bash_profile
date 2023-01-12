# zsh couldn't recongize "~", therefore this will only work under bash terminal
export PATH="$PATH:~/Library/Python/3.9/bin"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
# export PATH="$PATH:/usr/local/share/dotnet/dotnet"
# export DOTNET_ROOT="/usr/local/share/dotnet/dotnet"

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

# alias for project
alias p="cd ~/Documents/projects/"
alias u="cd ~/Documents/projects/unity/"


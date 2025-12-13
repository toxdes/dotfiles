# git aliases
alias gl="git log --oneline"
alias gst="git status"
alias ga="git add"
alias gc="git commit --verbose"
alias gca="git commit --amend --verbose"
alias gm="git merge"
alias gck="git checkout"
alias gf="git fetch --prune origin"
alias gp="git push origin"
alias gr="git rebase -i"
alias gb="git branch"
alias gd="git diff"

# programs
alias timer="sowon"
alias v="nvim"
alias h="btop"
alias offf="shutdown now"
alias serve="python3 -m http.server"
alias i="ping 8.8.8.8"
alias py="python3"

export PYTHON_SCRIPTS="$HOME/pro/python-scripts"
alias pc="python3 -i $PYTHON_SCRIPTS/imports.py"
alias days="$PYTHON_SCRIPTS/days.py"

# envs
alias ego="source $HOME/env/go.sh"
alias eflut="source $HOME/env/flutter.sh"



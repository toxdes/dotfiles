# git
alias gl="git log --oneline"
alias gst="git status"
alias ga="git add"
alias gc="git commit --verbose"
alias gca="git commit --amend --verbose"
alias gm="git merge"
alias gmf="git merge --ff-only"
alias gck="git checkout"
alias gf="git fetch origin"
alias gp="git push origin"
alias gb="git branch"
alias gsw="git switch"

gr() {
  git "$@" | nvim -R
}

# use neovim as pager for git diff
gd() {
    git diff "$@" | nvim -R
}

# programs
alias timer="sowon"
alias v="nvim"
alias ve='NVIM_APPNAME="nvim-dev" nvim'
alias h="btop"
alias offf="shutdown now"
alias serve="python3 -m http.server"
alias i="ping 8.8.8.8"
alias py="python3"
alias ls="eza"
alias oc="opencode"
alias occ="opencode --continue"
alias cx="codex"


# scripts
export PYS="$HOME/pro/python-scripts"
alias pc="python3 -i $PYS/utils/imports.py"
alias days="$PYS/utils/days.py"

# envs
alias ego="source $HOME/env/go.sh"
alias eflut="source $HOME/env/flutter.sh"
alias erust="source $HOME/env/rust.sh"
alias ejava="source $HOME/env/java.sh"

# apt
alias aptu="sudo apt update"
alias aptuu="sudo apt update && sudo apt upgrade -y"
alias apti="sudo apt install -y"
alias aptp="sudo apt purge"
alias aptf="sudo apt install -f && sudo apt autoremove"

# todo
alias todo="nvim ~/todo.md"

# start sway with unsupported gpu
alias sw="sway --unsupported-gpu"

# tmux
alias t="tmux"

# tailnet
tnssh() {
  ssh $1.tnvm.top
}

# save png from clipboard
pngpaste(){
  fname="${1:-$(date +%s).png}"
  cliphist list | head -n1 | cliphist decode > "$fname"
}

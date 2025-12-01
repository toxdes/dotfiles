# Bashrc Configuration

## Aliases

### Git

| Alias | Command | Description |
|-------|---------|-------------|
| `gl` | `git log --oneline` | View git log in one-line format |
| `gst` | `git status` | Show git status |
| `ga` | `git add` | Stage changes for commit |
| `gc` | `git commit --verbose` | Commit with verbose output |
| `gca` | `git commit --amend --verbose` | Amend last commit with verbose output |
| `gm` | `git merge` | Merge branches |
| `gck` | `git checkout` | Switch branches or restore files |
| `gf` | `git fetch --prune origin` | Fetch updates and clean up remote branches |
| `gp` | `git push origin` | Push to origin |
| `gr` | `git rebase -i` | Interactive rebase |
| `gb` | `git branch` | List or manage branches |
| `gd` | `git diff` | Show differences between commits |

### Programs

| Alias | Command | Description |
|-------|---------|-------------|
| `timer` | `sowon` | Start timer |
| `v` | `nvim` | Open Neovim |
| `h` | `btop` | Open system monitor |
| `offf` | `shutdown now` | Immediate system shutdown |
| `serve` | `python3 -m http.server` | Start HTTP server in current directory |
| `i` | `ping 8.8.8.8` | Check internet connectivity |
| `py` | `python3` | Run Python 3 |
| `pc` | `python3 -i $PYTHON_SCRIPTS/imports.py` | Python REPL with imports |
| `days` | `$PYTHON_SCRIPTS/days.py` | Run days script |

### Environments

| Alias | Command | Description |
|-------|---------|-------------|
| `ego` | `source /opt/env/go.sh` | Activate Go environment |
| `eflut` | `source /opt/env/flutter.sh` | Activate Flutter environment |


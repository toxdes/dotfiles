# Things to do after fresh install (Self Reminder)

## 0. Install dotfiles - Requires [GNU stow](https://www.gnu.org/software/stow/)
```sh
$ sudo apt install stow # install GNU stow
$ stow -t ~ foot tmux sway waybar nvim zed # link configs
```


## 1. Setting up `git`

Generate a ssh key pair.
[Stolen from here.](https://stackoverflow.com/questions/8588768/how-do-i-avoid-the-specification-of-the-username-and-password-at-every-git-push)

1. Generate a ssh-key for personal account
   ```sh
   $ ssh-keygen -t rsa # generate a key
   $ cat ~/.ssh/id_rsa.pub # copy contents
   ```
2. Goto [ssh settings](https://github.com/settings/ssh)
3. Add the machine.
4. generate a ssh-key for work account
   ```sh
   $ ssh-keygen -t rsa2 # generate a key
   $ cat ~/.ssh/id_rsa_2.pub # copy contents
   ```
5. Add `~/.ssh/config` as follows:
   ```
   Host github.com-work
      Hostname github.com
      User git
      IdentityFile ~/.ssh/id_rsa_2
   Host github.com
      Hostname github.com
      User git
      IdentityFile ~/.ssh/id_rsa
   ```
6. All origins for the repos must be as shown in example below.
   ```sh
   $ git remote set-url origin git+ssh://git@github.com/username/reponame.git # for personal
   $ git remote set-url origin git+ssh://git@github.com-work/username/reponame.git # for work
   ```

## 2. NodeJS change global npm path

```sh
$ mkdir ~/.npm-global
$ npm config set prefix '~/.npm-global'
$ export PATH=~/.npm-global/bin:$PATH
$ source ~/.profile
```

Done :|

## Color themes

Everforest is an additional theme alongside Solarized. Everforest has six variants (`everforest_{light,dark}_{hard,medium,soft}`) for Alacritty, Waybar, Sway, tmux, and Rofi. The palettes use `sainnhe/everforest` at commit `85a86eb`. Solarized Dark and Light remain available in all of these apps.

Each app has one active theme selector. Keep one palette selected in each:

- **Alacritty:** choose an import in `alacritty/.config/alacritty/alacritty.toml`.
- **Waybar:** choose an import at the top of `waybar/.config/waybar/style.css`.
- **Sway:** choose the include in `sway/.config/sway/config`, then reload Sway.
- **tmux:** choose the `source-file` in `tmux/.tmux.conf`, then reload tmux.
- **Rofi:** choose the `@theme` in `rofi/.config/rofi/config.rasi` and the matching import in `rofi/.config/rofi/powermenu/type-1/shared/colors.rasi`.
- **Neovim and nvim-dev:** change the `active_theme` assignment in each profile's `lua/plugins/colorschemes.lua` to one of the eight entries in its `themes` table. Lualine uses `auto` to follow the selected scheme.

Everforest Dark Hard is the current default. The six Everforest choices and both Solarized modes are ready to select in every listed app.

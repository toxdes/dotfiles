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
